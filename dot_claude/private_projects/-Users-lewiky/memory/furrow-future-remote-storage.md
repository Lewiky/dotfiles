---
name: furrow-future-remote-storage
description: "Furrow now uses Supabase as the source of truth; AsyncStorage is a boot cache. Screens go through useActions() (async, optimistic + rollback), not apply(repo.X) directly."
metadata: 
  node_type: memory
  type: project
  originSessionId: 333badb5-d387-4361-afaf-5541e1605ec8
---

The Furrow MVP (mobile "Strava for noticing" app, in `furrow/mvp/furrow-mvp`) has flipped from local-only to **Supabase-as-source-of-truth** as of 2026-06-12.

**Layered architecture:**
- **Screens** call `useActions()` (in `src/state/actions.ts`) — async functions that wrap each former `apply(repo.X(...))` callsite.
- **Action layer** snapshots the previous data, applies the optimistic local update, awaits the matching Supabase write, and on error rolls back via `apply(prev)` then rethrows.
- **StoragePort** (interface in `src/data/storage.ts`, implementation `supabaseAdapter` in `src/data/supabaseAdapter.ts`) is the rich CRUD surface — hydrate, insert/update/delete per entity, photo upload, signed-URL batch sign, and the multi-entity `finish_recording` RPC for the recording-finish flow.
- **CachePort** (`src/data/cache.ts`) is a separate concern — AsyncStorage at key `furrow.data.v4`. On boot FurrowStore loads cache instantly, then runs `port.hydrate(userId)` and merges the result. Cache write-through happens on every `apply()`.
- **Repository** (`src/data/repository.ts`) still pure — transforms `FurrowData`. The action layer is its only caller.

**Why:** The user explicitly asked to move all storage to Supabase as SoT (was previously planned as a future-version refactor; landed in 2026-06-12). The action layer was the chosen path over making `apply()` itself async because every screen used the synchronous form.

**How to apply:**
- New mutations go in `src/state/actions.ts` with the snapshot → optimistic apply → await port → rollback pattern.
- New entity types need: `mappers.ts` translators (DB row ↔ TS shape), a `StoragePort` method in `storage.ts`, the impl in `supabaseAdapter.ts`, and an action in `actions.ts`.
- Geography columns use WKT `POINT(lng lat)` — always via `src/data/wkt.ts` helpers, never inline string-building (the lng/lat flip is the bug class to avoid).
- IDs are UUIDs (via `expo-crypto.randomUUID`) — generated client-side so optimistic and remote rows share identity.
- The `furrow_storage_rpcs` migration in `furrow-supabase/supabase/migrations/` defines `hydrate_patches / hydrate_logs / hydrate_route_points`, `create_tracked_species`, and `finish_recording`.
- Destructive ops (archive/restore/delete/reassign) are gated on `useFurrow().hydrating === true` — on hydrate failure the flag stays true, gating these against a stale cache.
- The deferred [[furrow-supabase-deploy]] note tracks the one outstanding manual step from this migration (push the RPCs to the remote project).
