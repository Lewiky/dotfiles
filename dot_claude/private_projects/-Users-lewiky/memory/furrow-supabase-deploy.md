---
name: furrow-supabase-deploy
description: "Furrow's Supabase migrations are pushed via `supabase db push` from furrow-supabase/. The harness blocks Claude from doing this — surface it to the user."
metadata: 
  node_type: memory
  type: reference
  originSessionId: a52b68b2-e694-42c2-9438-9f94646e5dae
---

To push pending Furrow Supabase migrations to the linked remote project:

```
cd ~/Projects/furrow/mvp/furrow-supabase
supabase db push --dry-run     # preview first
supabase db push                # apply
```

The harness denies `supabase db push` autonomously even when listed in ExitPlanMode allowed prompts — it treats the linked project as production infrastructure. **Surface this as a user action** rather than retrying.

The linked project ref lives in `furrow-supabase/supabase/.temp/project-ref`. Migration list to check state:

```
cd ~/Projects/furrow/mvp/furrow-supabase
supabase migration list --linked
```
