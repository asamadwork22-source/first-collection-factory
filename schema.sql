-- First Collection Factory: Fabric & Rib Inventory schema
-- Run this once in Supabase → SQL Editor → New query → Run

create extension if not exists "pgcrypto";

create table if not exists fabric_inventory (
  id uuid primary key default gen_random_uuid(),
  fabric_name text not null,
  qr_id text unique not null,
  opening_cloth_kg numeric not null default 0,
  opening_rib_kg numeric not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists fabric_log (
  id uuid primary key default gen_random_uuid(),
  fabric_id uuid not null references fabric_inventory(id) on delete cascade,
  entry_type text not null check (entry_type in ('usage','restock')),
  design text,
  cloth_qty numeric not null default 0,
  rib_qty numeric not null default 0,
  entered_by text,
  entry_date timestamptz not null default now()
);

-- Live balance view: opening stock + restocks - usage, per fabric
create or replace view fabric_balance as
select
  fi.id,
  fi.fabric_name,
  fi.qr_id,
  fi.opening_cloth_kg,
  fi.opening_rib_kg,
  fi.opening_cloth_kg
    + coalesce(sum(case when fl.entry_type = 'restock' then fl.cloth_qty
                         when fl.entry_type = 'usage' then -fl.cloth_qty
                         else 0 end), 0) as current_cloth_kg,
  fi.opening_rib_kg
    + coalesce(sum(case when fl.entry_type = 'restock' then fl.rib_qty
                         when fl.entry_type = 'usage' then -fl.rib_qty
                         else 0 end), 0) as current_rib_kg
from fabric_inventory fi
left join fabric_log fl on fl.fabric_id = fi.id
group by fi.id;

-- Row Level Security: table is only reachable via the project's anon key,
-- which you will not share publicly, so open policies are fine for a small
-- 1-2 person internal tool.
alter table fabric_inventory enable row level security;
alter table fabric_log enable row level security;

drop policy if exists "allow all - inventory" on fabric_inventory;
create policy "allow all - inventory" on fabric_inventory for all using (true) with check (true);

drop policy if exists "allow all - log" on fabric_log;
create policy "allow all - log" on fabric_log for all using (true) with check (true);
