-- Run this SQL in Supabase Dashboard > SQL Editor.
create table if not exists public.user_workspace (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.user_workspace enable row level security;
drop policy if exists "Users can read own workspace" on public.user_workspace;
create policy "Users can read own workspace"
on public.user_workspace for select to authenticated
using (auth.uid() = user_id);
drop policy if exists "Users can insert own workspace" on public.user_workspace;
create policy "Users can insert own workspace"
on public.user_workspace for insert to authenticated
with check (auth.uid() = user_id);
drop policy if exists "Users can update own workspace" on public.user_workspace;
create policy "Users can update own workspace"
on public.user_workspace for update to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);
