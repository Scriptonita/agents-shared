---
name: supabase
description: Patterns and hard rules for Supabase in TypeScript apps — Auth with SSR in Next.js (@supabase/ssr, browser/server clients, proxy), Postgres functions, declarative schema and migrations, and Realtime (broadcast, presence, triggers, RLS on channels). Use when writing or reviewing code that touches Supabase auth, database functions, schema/migrations or realtime subscriptions.
---

# Supabase

Load **only** the reference that matches the task:

| Task | Reference |
|---|---|
| Auth in Next.js (App Router, SSR, middleware/proxy, cookies) | [references/auth-nextjs-ssr.md](references/auth-nextjs-ssr.md) |
| Writing Postgres functions (`security invoker`, `search_path`, triggers) | [references/database-functions.md](references/database-functions.md) |
| Schema changes and migrations (declarative schema, `supabase db diff`) | [references/declarative-schema.md](references/declarative-schema.md) |
| Realtime: broadcast, presence, database triggers, channel authorization | [references/realtime.md](references/realtime.md) |

## Always

- Use `@supabase/ssr` (`createBrowserClient` / `createServerClient`) with the
  `getAll`/`setAll` cookie methods. Never `@supabase/auth-helpers-nextjs` and never
  the individual `get`/`set`/`remove` cookie methods.
- Row Level Security on every table exposed to the client, with an index on every
  column used in a policy.
- Schema changes go through migrations generated from the declarative schema, never
  through ad-hoc edits on the hosted database.
- Database functions default to `security invoker` and set `search_path = ''` with
  fully qualified names.
- Realtime: prefer `broadcast` (private channels, `private: true`) over
  `postgres_changes`; always clean up subscriptions.
- Keys: only the anon/publishable key reaches the browser. The service-role key is
  server-only and never committed.
