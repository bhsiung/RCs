---
description: Ship the current changes — commit and deploy.
---

Ship the current changes: commit and deploy.

1. Run `git status` and `git diff --staged` and `git diff` to review all changes
2. Stage all relevant changed files (never stage `.env`, `.dev.vars`, or other secrets)
3. Write a concise commit message summarizing the changes
4. Commit
5. Run `pnpm build && npx wrangler deploy` to deploy to Cloudflare Workers
6. Verify deployment by hitting the health endpoint
7. Report the deployed URL and commit hash
