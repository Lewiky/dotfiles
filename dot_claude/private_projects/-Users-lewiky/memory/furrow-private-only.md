---
name: furrow-private-only
description: "Furrow is private-by-design — every account is private, there is no public-account option; all follow attempts go through a request/accept flow."
metadata: 
  node_type: memory
  type: project
  originSessionId: a52b68b2-e694-42c2-9438-9f94646e5dae
---

Furrow's account model is **private-only**. Every account is private. There
is no public-account mode and no `is_private` flag — privacy is implicit.

Every follow attempt creates a `follow_request` for the target user to
explicitly accept or decline before the requester gets a row in `follows`.
The old direct `INSERT INTO follows` path (the original `followUser`
action) is retired in favour of `request_follow` / `accept_request` /
`decline_request` RPCs.

**Why:** Confirmed during planning for BACKLOG.md P1 #6 (follow requests
/ private accounts) on 2026-06-16. The user clarified mid-question:
"all accounts should be private — public accounts aren't an option."

**How to apply:** Don't add `profile.is_private` or per-user privacy
toggles. Don't branch follow behaviour on profile flags. The visibility
chain (`_select_followed` RLS policies, `feed_recent`, off-graph fetches)
stays follower-gated — which it already is. The only product change is
that becoming a follower now requires acceptance. See [[furrow-future-remote-storage]]
for the broader architecture.
