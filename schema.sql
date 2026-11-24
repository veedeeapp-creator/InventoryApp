-- Jalankan di Supabase: SQL Editor > New query > Run
create table if not exists public.app_state (
  user_id    uuid primary key references auth.users(id) on delete cascade,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.app_state enable row level security;

create policy "app_state_select_own" on public.app_state
  for select to authenticated
  using ((select auth.uid()) = user_id);

create policy "app_state_insert_own" on public.app_state
  for insert to authenticated
  with check ((select auth.uid()) = user_id);

create policy "app_state_update_own" on public.app_state
  for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
