# CarMaintenance — Технічна документація бази даних

**Версія:** 1.0  
**Дата:** 2026-05-05  
**Статус:** Draft

---

## Архітектура сховища

Двошарова модель: **локальна SQLite** (drift) + **хмарна PostgreSQL** (Supabase).

```
┌─────────────────────────┐        ┌──────────────────────────┐
│   Flutter App           │        │   Supabase (PostgreSQL)  │
│                         │        │                          │
│  drift (SQLite)         │◄──────►│  auth.users              │
│  ─ повний офлайн        │  sync  │  public.*                │
│  ─ шифрування           │        │  RLS policy per user     │
│  ─ sync queue           │        │                          │
└─────────────────────────┘        └──────────────────────────┘
```

---

## Локальна БД — SQLite (drift)

### Таблиці

#### `users`
Локальний профіль поточного користувача. Завжди один запис.

| Колонка | Тип | Примітки |
|---------|-----|----------|
| `id` | TEXT PK | UUID, з Supabase Auth |
| `email` | TEXT | |
| `display_name` | TEXT | |
| `avatar_url` | TEXT | nullable |
| `unit_system` | TEXT | `km` / `miles`, default `km` |
| `created_at` | INTEGER | Unix timestamp |
| `updated_at` | INTEGER | Unix timestamp |

---

#### `vehicles`
Автомобілі користувача.

| Колонка | Тип | Примітки |
|---------|-----|----------|
| `id` | TEXT PK | UUID |
| `user_id` | TEXT | FK → users.id |
| `brand` | TEXT | Марка |
| `model` | TEXT | Модель |
| `year` | INTEGER | Рік випуску |
| `mileage` | INTEGER | Поточний пробіг |
| `nickname` | TEXT | nullable |
| `vin` | TEXT | nullable |
| `plate` | TEXT | nullable |
| `fuel_type` | TEXT | `gasoline` / `diesel` / `lpg` / `electric` / `hybrid` |
| `engine_volume` | REAL | nullable |
| `photo_url` | TEXT | nullable |
| `is_active` | INTEGER | 0/1, активне авто в UI |
| `is_deleted` | INTEGER | 0/1, soft-delete |
| `created_at` | INTEGER | |
| `updated_at` | INTEGER | |
| `synced_at` | INTEGER | nullable, остання синхронізація |

---

#### `maintenance_templates`
Системні шаблони ТО (тільки для читання, не синхронізуються).

| Колонка | Тип | Примітки |
|---------|-----|----------|
| `id` | TEXT PK | UUID |
| `name_uk` | TEXT | Назва (укр) |
| `name_en` | TEXT | Назва (англ) |
| `interval_km` | INTEGER | nullable |
| `interval_months` | INTEGER | nullable |
| `category` | TEXT | `engine` / `brakes` / `tires` / `electrical` / `other` |
| `is_system` | INTEGER | 1 = системний, 0 = кастомний |

> Системні шаблони вшиті у код (seed при першому запуску). Кастомні шаблони є записами де `is_system = 0`.

---

#### `maintenance_works`
Планові роботи для конкретного авто. Зв'язує авто з шаблоном або кастомним описом.

| Колонка | Тип | Примітки |
|---------|-----|----------|
| `id` | TEXT PK | UUID |
| `vehicle_id` | TEXT | FK → vehicles.id |
| `template_id` | TEXT | nullable, FK → maintenance_templates.id |
| `custom_name` | TEXT | nullable, якщо не шаблон |
| `custom_description` | TEXT | nullable |
| `interval_km` | INTEGER | nullable, може перевизначити шаблон |
| `interval_months` | INTEGER | nullable |
| `next_date` | INTEGER | планова дата (Unix timestamp) |
| `next_mileage` | INTEGER | nullable, плановий пробіг |
| `status` | TEXT | `ok` / `soon` / `overdue` |
| `is_deleted` | INTEGER | 0/1, soft-delete |
| `created_at` | INTEGER | |
| `updated_at` | INTEGER | |
| `synced_at` | INTEGER | nullable |

---

#### `maintenance_records`
Виконані роботи (факт ТО).

| Колонка | Тип | Примітки |
|---------|-----|----------|
| `id` | TEXT PK | UUID |
| `work_id` | TEXT | FK → maintenance_works.id |
| `vehicle_id` | TEXT | FK → vehicles.id |
| `performed_at` | INTEGER | Дата виконання |
| `mileage_at_service` | INTEGER | Пробіг на момент ТО |
| `service_location` | TEXT | nullable (`home` / назва СТО) |
| `cost` | REAL | nullable |
| `notes` | TEXT | nullable |
| `next_date_override` | INTEGER | nullable, вручну вказана наступна дата |
| `next_mileage_override` | INTEGER | nullable |
| `is_deleted` | INTEGER | 0/1 |
| `created_at` | INTEGER | |
| `updated_at` | INTEGER | |
| `synced_at` | INTEGER | nullable |

---

#### `record_parts`
Запчастини, використані при ТО.

| Колонка | Тип | Примітки |
|---------|-----|----------|
| `id` | TEXT PK | UUID |
| `record_id` | TEXT | FK → maintenance_records.id |
| `name` | TEXT | Назва |
| `part_number` | TEXT | nullable, артикул |
| `manufacturer` | TEXT | nullable |
| `created_at` | INTEGER | |

---

#### `record_photos`
Фото до записів ТО.

| Колонка | Тип | Примітки |
|---------|-----|----------|
| `id` | TEXT PK | UUID |
| `record_id` | TEXT | FK → maintenance_records.id |
| `local_path` | TEXT | Шлях на пристрої |
| `remote_url` | TEXT | nullable, URL після upload |
| `created_at` | INTEGER | |

---

#### `notification_inbox`
Вхідні сповіщення (Inbox).

| Колонка | Тип | Примітки |
|---------|-----|----------|
| `id` | TEXT PK | UUID |
| `work_id` | TEXT | nullable, FK → maintenance_works.id |
| `title` | TEXT | |
| `body` | TEXT | |
| `is_read` | INTEGER | 0/1 |
| `created_at` | INTEGER | |

---

#### `sync_queue`
Черга змін для синхронізації при відновленні мережі.

| Колонка | Тип | Примітки |
|---------|-----|----------|
| `id` | INTEGER PK | autoincrement |
| `entity_type` | TEXT | `vehicle` / `work` / `record` / `part` / `photo` |
| `entity_id` | TEXT | UUID запису |
| `operation` | TEXT | `insert` / `update` / `delete` |
| `payload` | TEXT | JSON-серіалізовані дані |
| `created_at` | INTEGER | |
| `retry_count` | INTEGER | default 0 |

---

## Хмарна БД — PostgreSQL (Supabase)

Схема ідентична локальній, але з адаптаціями для PostgreSQL:
- `INTEGER` → `BIGINT` / `TIMESTAMPTZ`
- `TEXT PK` → `UUID DEFAULT gen_random_uuid()`
- `is_deleted` → `deleted_at TIMESTAMPTZ` (soft-delete)
- Всі дати зберігаються як `TIMESTAMPTZ`

### Row Level Security (RLS)

Кожна таблиця має RLS. Базова політика:

```sql
-- Приклад для таблиці vehicles
CREATE POLICY "users_own_vehicles" ON vehicles
  USING (user_id = auth.uid());
```

### Таблиці Supabase

| Таблиця | Примітки |
|---------|----------|
| `profiles` | Відповідає `users`, прив'язана до `auth.users` |
| `vehicles` | + `deleted_at` замість `is_deleted` |
| `maintenance_works` | + `deleted_at` |
| `maintenance_records` | + `deleted_at` |
| `record_parts` | Без soft-delete (видалення з record) |
| `record_photos` | URL в Supabase Storage |
| `sync_log` | Лог конфліктів синхронізації |

### `sync_log` (тільки сервер)

| Колонка | Тип | Примітки |
|---------|-----|----------|
| `id` | UUID PK | |
| `user_id` | UUID | |
| `entity_type` | TEXT | |
| `entity_id` | UUID | |
| `conflict_type` | TEXT | `update_conflict` / `delete_conflict` |
| `client_payload` | JSONB | Що прийшло з пристрою |
| `server_payload` | JSONB | Що було на сервері |
| `resolution` | TEXT | `client_wins` / `server_wins` |
| `created_at` | TIMESTAMPTZ | |

---

## Стратегія синхронізації

```
Офлайн → online:
1. Читаємо sync_queue по порядку (retry_count < 3)
2. Для кожного запису — UPSERT на Supabase
3. Конфлікт (updated_at сервера > updated_at клієнта):
   → Last-write-wins (клієнт виграє для user-initiated змін)
   → Логується в sync_log
4. При успіху → видаляємо з sync_queue, оновлюємо synced_at
5. При помилці → retry_count++, спробуємо пізніше
```

### Статуси запису (status в maintenance_works)

Розраховуються динамічно при читанні або при оновленні пробігу:

| Умова | Статус |
|-------|--------|
| next_date > today + 20% інтервалу | `ok` |
| next_date ≤ today + 20% інтервалу | `soon` |
| next_date < today або next_mileage < current_mileage | `overdue` |

---

## Шифрування

- Колонки `vin`, `plate` — шифруються на рівні Dart перед записом у drift
- Ключ шифрування → `flutter_secure_storage`
- Алгоритм: AES-256

---

## Індекси (SQLite)

```sql
CREATE INDEX idx_vehicles_user ON vehicles(user_id);
CREATE INDEX idx_works_vehicle ON maintenance_works(vehicle_id);
CREATE INDEX idx_records_work ON maintenance_records(work_id);
CREATE INDEX idx_records_vehicle ON maintenance_records(vehicle_id);
CREATE INDEX idx_records_performed ON maintenance_records(performed_at);
CREATE INDEX idx_sync_queue_created ON sync_queue(created_at);
```

---

## Seed-дані (системні шаблони)

15 вбудованих шаблонів ТО (визначені у PRD секція 3.4.1).  
Вставляються при першому запуску через `drift` migration.

---

## Міграції

Управляються через `drift` `SchemaVersion` + `MigrationStrategy`.  
Поточна версія схеми: **1**.