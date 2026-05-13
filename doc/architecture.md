# CarMaintenance — Архітектурний гайд

**Версія:** 1.1  
**Дата:** 2026-05-05

---

## Зміст

1. [Концепція](#1-концепція)
2. [Freezed — кодогенерація](#2-freezed--кодогенерація)
3. [Три шари архітектури](#3-три-шари-архітектури)
4. [Структура папок](#4-структура-папок)
5. [Presentation Layer — детально](#5-presentation-layer--детально)
6. [Domain Layer — детально](#6-domain-layer--детально)
7. [Data Layer — детально](#7-data-layer--детально)
8. [Залежності між шарами](#8-залежності-між-шарами)
9. [SOLID принципи в проекті](#9-solid-принципи-в-проекті)
10. [GoF патерни в проекті](#10-gof-патерни-в-проекті)
11. [Clean Code правила](#11-clean-code-правила)
12. [Приклад: фіча Vehicles](#12-приклад-фіча-vehicles)

---

## 1. Концепція

Проект побудований на **Clean Architecture** з трьома шарами. Кожен шар знає тільки про той, що нижче. Залежності течуть лише в одному напрямку: **Presentation → Domain ← Data**.

```
┌──────────────────────────────────────┐
│           PRESENTATION               │  UI, Bloc/Cubit, ViewModel (@freezed)
│  Page → Controller → ViewModel       │
├──────────────────────────────────────┤
│              DOMAIN                  │  Бізнес-логіка, чиста Dart
│  Entity (@freezed), UseCase,         │
│  Repository (абстр), Failure         │
├──────────────────────────────────────┤
│               DATA                   │  Джерела даних
│  DTO (@freezed + json), DataSource,  │
│  Repository (impl), Mapper           │
└──────────────────────────────────────┘
```

**Ключові правила:**
- `Presentation` ніколи не імпортує `Data`
- `Domain` — чистий Dart, без Flutter, без drift, без dio
- `Data` реалізує інтерфейси з `Domain`
- `Page` не містить жодної логіки — тільки виклики `Controller`
- `@freezed` обов'язковий для Entity, ViewModel, DTO, Failure

---

## 2. Freezed — кодогенерація

### Що генерує freezed

| Клас | Що отримуємо безкоштовно |
|------|--------------------------|
| Entity | `copyWith`, `==`, `hashCode`, `toString` |
| ViewModel | `copyWith`, `==`, `hashCode`, `toString` |
| DTO | `copyWith`, `fromJson`, `toJson` (разом з json_serializable) |
| Failure | sealed union, `when`, `maybeWhen`, `map` |

### Залежності в pubspec.yaml

```yaml
dependencies:
  freezed_annotation: ^3.2.5
  json_annotation: ^4.9.0      # для DTO fromJson/toJson

dev_dependencies:
  freezed: ^3.2.5
  build_runner: ^2.4.13
  json_serializable: ^6.9.0
```

### Команди кодогенерації

```bash
# Одноразова генерація (перед коммітом)
dart run build_runner build --delete-conflicting-outputs

# Watch-режим під час розробки
dart run build_runner watch --delete-conflicting-outputs
```

### Правила файлів

Кожен freezed-клас потребує `part` директив:

```dart
// Entity — тільки freezed
part 'vehicle.freezed.dart';

// DTO — freezed + json_serializable
part 'vehicle_dto.freezed.dart';
part 'vehicle_dto.g.dart';
```

Згенеровані файли (`*.freezed.dart`, `*.g.dart`) — **комітяться в git**.

### Де використовується @freezed

| Шар | Клас | Анотація |
|-----|------|----------|
| Domain | Entity | `@freezed` |
| Domain | Failure | `@freezed` (sealed union) |
| Presentation | ViewModel | `@freezed` |
| Data | DTO | `@freezed` + `@JsonSerializable` |

---

## 3. Три шари архітектури

### 3.1 Data Layer

Відповідає за отримання та збереження даних. Знає про БД, HTTP, кеш.

**Відповідальності:**
- Локальне сховище (drift/SQLite)
- Віддалене сховище (Supabase REST/Realtime)
- Маппінг `DTO ↔ Entity`
- Реалізація `Repository` інтерфейсів з Domain

**Підпапки:**
```
data/
  api/         # HTTP/REST клієнти, endpoint-визначення
  di/          # Injectable @Module для реєстрації Data залежностей
  manager/     # DataManager (sync, cache — опціонально)
  model/       # DTO (@freezed + json_serializable) + Mapper
  repository/  # Реалізація Repository інтерфейсів з Domain
  source/
    local/     # Локальні DataSource (drift/SQLite)
    remote/    # Віддалені DataSource (Supabase)
```

---

### 3.2 Domain Layer

Ядро застосунку. Не залежить ні від чого зовнішнього.

**Відповідальності:**
- Визначення бізнес-сутностей (Entity)
- Оголошення інтерфейсів репозиторіїв
- Бізнес-правила у UseCase та Service

**Підпапки:**
```
domain/
  model/       # @freezed Entity (чистий Dart, без зовнішніх залежностей)
  repository/  # Абстрактні interface-контракти
  service/     # Domain Service (бізнес-логіка що охоплює кілька репо)
  use_case/    # UseCase<T, Params> — один клас = одна дія
```

---

### 3.3 Presentation Layer

Все що бачить користувач. Не містить бізнес-логіки.

**Відповідальності:**
- Відображення даних (Page/Widget)
- Реакція на дії користувача → делегування в Cubit
- Управління станом через Cubit + ViewModel

**Підпапки:**
```
presentation/
  app/     # Feature-рівень: маршрути, bootstrap (опціонально)
  common/  # Перевикористовувані Widget-и конкретної фічі
  di/      # Cubit + injectable-реєстрація для Presentation шару
  model/   # @freezed ViewModel — immutable стан для Page
  pages/   # StatelessWidget — тільки UI, жодної логіки
```

---

## 4. Структура папок

```
lib/
├── core/
│   ├── di/              # get_it + injectable (injection.dart)
│   ├── network/         # DioClient, NetworkInfo
│   ├── error/           # Either<L,R>, Failure (@freezed sealed), Exceptions
│   ├── usecase/         # UseCase<T,Params>, NoParams
│   ├── constants/       # AppConstants
│   └── extensions/      # EitherExtension
│
├── features/
│   └── vehicles/                         # приклад фічі (інші аналогічно)
│       ├── data/
│       │   ├── api/                      # VehiclesApiService (HTTP)
│       │   ├── di/                       # @Module реєстрація Data залежностей
│       │   ├── manager/                  # VehiclesSyncManager (опціонально)
│       │   ├── model/
│       │   │   ├── vehicle_dto.dart      # @freezed DTO
│       │   │   ├── vehicle_dto.freezed.dart
│       │   │   ├── vehicle_dto.g.dart
│       │   │   └── vehicle_mapper.dart   # DTO ↔ Entity
│       │   ├── repository/
│       │   │   └── vehicles_repository_impl.dart
│       │   └── source/
│       │       ├── local/
│       │       │   └── vehicles_local_datasource.dart
│       │       └── remote/
│       │           └── vehicles_remote_datasource.dart
│       ├── domain/
│       │   ├── model/
│       │   │   ├── vehicle.dart          # @freezed Entity
│       │   │   └── vehicle.freezed.dart
│       │   ├── repository/
│       │   │   └── vehicles_repository.dart  # abstract interface
│       │   ├── service/                  # VehiclesService (опціонально)
│       │   └── use_case/
│       │       ├── get_vehicles_usecase.dart
│       │       └── add_vehicle_usecase.dart
│       └── presentation/
│           ├── app/                      # маршрути фічі (опціонально)
│           ├── common/                   # VehicleCard, VehicleAvatar...
│           ├── di/
│           │   └── vehicles_cubit.dart   # @injectable Cubit
│           ├── model/
│           │   ├── vehicles_view_model.dart   # @freezed ViewModel
│           │   └── vehicles_view_model.freezed.dart
│           └── pages/
│               └── vehicles_page.dart
│
├── shared/
│   ├── widgets/         # AppButton, AppLoadingIndicator, AppErrorWidget
│   ├── theme/           # AppTheme, AppColors, AppTextStyles
│   └── l10n/            # app_uk.arb, app_en.arb
│
└── main.dart
```

---

## 5. Presentation Layer — детально

### Правило: Page не має логіки

`Page` — це `StatelessWidget`, що знає тільки про `Controller` і `ViewModel`.

```dart
// ✅ Правильно
class VehiclesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehiclesCubit, VehiclesViewModel>(
      builder: (context, vm) {
        if (vm.isLoading) return const AppLoadingIndicator();
        if (vm.error != null) return AppErrorWidget(message: vm.error!);
        return VehiclesList(vehicles: vm.vehicles);
      },
    );
  }
}

// ❌ Неправильно — логіка в Page
class VehiclesPage extends StatefulWidget {
  // фільтрація, сортування, API-виклики — НЕ ТУТ
}
```

---

### ViewModel з @freezed

Генерує `copyWith`, `==`, `hashCode` автоматично. Не пишемо їх вручну.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/vehicle.dart';

part 'vehicles_view_model.freezed.dart';

@freezed
class VehiclesViewModel with _$VehiclesViewModel {
  const factory VehiclesViewModel({
    @Default([]) List<Vehicle> vehicles,
    @Default(false) bool isLoading,
    String? error,
    String? activeVehicleId,
  }) = _VehiclesViewModel;

  // Стартовий стан — всі @Default вже задані у factory
  factory VehiclesViewModel.initial() => const VehiclesViewModel();
}
```

> `@Default([])` і `@Default(false)` замінюють ручний `initial()` конструктор.  
> `copyWith` генерується — не пишемо вручну.

---

### Controller (Cubit)

Відповідає за:
- Виклик `UseCase`-ів
- Обробку результату (`Either<Failure, T>`)
- Перетворення у `ViewModel` та `emit`
- Локальна UI-логіка (фільтр, сортування, пагінація)

```dart
class VehiclesCubit extends Cubit<VehiclesViewModel> {
  VehiclesCubit({
    required GetVehiclesUseCase getVehicles,
    required AddVehicleUseCase addVehicle,
  })  : _getVehicles = getVehicles,
        _addVehicle = addVehicle,
        super(const VehiclesViewModel());

  final GetVehiclesUseCase _getVehicles;
  final AddVehicleUseCase _addVehicle;

  Future<void> loadVehicles() async {
    _emitLoading();
    final result = await _getVehicles(NoParams());
    result.fold(_emitFailure, _emitVehicles);
  }

  void _emitLoading() => emit(state.copyWith(isLoading: true, error: null));

  void _emitFailure(Failure failure) => emit(
    state.copyWith(
      isLoading: false,
      // failure.when дає exhaustive pattern matching без switch
      error: failure.when(
        network: (msg) => msg,
        cache: (msg) => msg,
        auth: (msg) => msg,
        notFound: (msg) => msg,
      ),
    ),
  );

  void _emitVehicles(List<Vehicle> vehicles) =>
      emit(state.copyWith(isLoading: false, vehicles: vehicles));
}
```

---

### l10n (Локалізація)

- Всі рядки у `lib/shared/l10n/*.arb`
- Доступ через `context.l10n.someKey`
- У `Page` — тільки `context.l10n`, без хардкодних рядків
- У `ViewModel` — enum або null, переклад у `Page`

```
shared/l10n/
  app_uk.arb     # Українська (основна)
  app_en.arb     # Англійська
```

---

## 6. Domain Layer — детально

### Entity з @freezed

Immutable Dart клас. Жодних Flutter чи ORM залежностей.  
`@freezed` генерує `copyWith`, `==`, `hashCode`, `toString`.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'fuel_type.dart';

part 'vehicle.freezed.dart';

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required String id,
    required String brand,
    required String model,
    required int year,
    required int mileage,
    String? nickname,
    String? vin,
    String? photoUrl,
    @Default(FuelType.gasoline) FuelType fuelType,
  }) = _Vehicle;
}
```

> `Domain` не імпортує `freezed` — лише `freezed_annotation` (тільки анотації, без генератора).  
> Генератор `freezed` у `dev_dependencies`.

---

### Failure як @freezed sealed union

Замість ієрархії класів — sealed union з `when` / `maybeWhen`.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network(String message) = NetworkFailure;
  const factory Failure.cache(String message) = CacheFailure;
  const factory Failure.auth(String message) = AuthFailure;
  const factory Failure.notFound(String message) = NotFoundFailure;
  const factory Failure.unknown(String message) = UnknownFailure;
}
```

**Використання в Cubit — exhaustive (компілятор перевіряє всі кейси):**

```dart
final message = failure.when(
  network: (_) => context.l10n.errorNetwork,
  cache: (_) => context.l10n.errorCache,
  auth: (_) => context.l10n.errorAuth,
  notFound: (_) => context.l10n.errorNotFound,
  unknown: (msg) => msg,
);
```

---

### Repository Interface

Абстрактний контракт. `Domain` оголошує — `Data` реалізує.

```dart
abstract interface class VehiclesRepository {
  Future<Either<Failure, List<Vehicle>>> getAll();
  Future<Either<Failure, Vehicle>> getById(String id);
  Future<Either<Failure, Vehicle>> add(Vehicle vehicle);
  Future<Either<Failure, Vehicle>> update(Vehicle vehicle);
  Future<Either<Failure, void>> delete(String id);
}
```

---

### UseCase

Одна дія = один клас. Базовий інтерфейс з `core/usecase/`.

```dart
// core/usecase/usecase.dart
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

@freezed
class NoParams with _$NoParams {
  const factory NoParams() = _NoParams;
}

// features/vehicles/domain/usecases/get_vehicles.dart
class GetVehiclesUseCase implements UseCase<List<Vehicle>, NoParams> {
  GetVehiclesUseCase(this._repository);
  final VehiclesRepository _repository;

  @override
  Future<Either<Failure, List<Vehicle>>> call(NoParams params) =>
      _repository.getAll();
}
```

---

## 7. Data Layer — детально

### DTO з @freezed + json_serializable

`@freezed` + `@JsonSerializable` генерує `fromJson` / `toJson` автоматично.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_dto.freezed.dart';
part 'vehicle_dto.g.dart';       // генерується json_serializable

@freezed
class VehicleDto with _$VehicleDto {
  const factory VehicleDto({
    required String id,
    required String brand,
    required String model,
    required int year,
    required int mileage,
    String? nickname,
    String? vin,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'fuel_type') String? fuelType,
    @JsonKey(name: 'updated_at') int? updatedAt,
  }) = _VehicleDto;

  factory VehicleDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleDtoFromJson(json);
}
```

> `toJson()` також генерується — `dto.toJson()` для запису в Supabase/drift.

---

### Mapper

Конвертує `DTO ↔ Entity`. Окремий клас — не метод на DTO чи Entity.

```dart
import '../../domain/entities/vehicle.dart';
import '../models/vehicle_dto.dart';

abstract final class VehicleMapper {
  static Vehicle toEntity(VehicleDto dto) => Vehicle(
    id: dto.id,
    brand: dto.brand,
    model: dto.model,
    year: dto.year,
    mileage: dto.mileage,
    nickname: dto.nickname,
    vin: dto.vin,
    photoUrl: dto.photoUrl,
    fuelType: FuelType.values.byName(dto.fuelType ?? 'gasoline'),
  );

  static VehicleDto toDto(Vehicle entity) => VehicleDto(
    id: entity.id,
    brand: entity.brand,
    model: entity.model,
    year: entity.year,
    mileage: entity.mileage,
    nickname: entity.nickname,
    vin: entity.vin,
    photoUrl: entity.photoUrl,
    fuelType: entity.fuelType.name,
  );
}
```

---

### Repository Implementation

Оркеструє локальний і віддалений DataSource.

```dart
class VehiclesRepositoryImpl implements VehiclesRepository {
  VehiclesRepositoryImpl({
    required this.localDs,
    required this.remoteDs,
    required this.networkInfo,
  });

  final VehiclesLocalDataSource localDs;
  final VehiclesRemoteDataSource remoteDs;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<Vehicle>>> getAll() async {
    try {
      final dtos = await localDs.getAll();
      final entities = dtos.map(VehicleMapper.toEntity).toList();
      _syncIfOnline();
      return Right(entities);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    }
  }

  Future<void> _syncIfOnline() async {
    if (await networkInfo.isConnected) {
      // тригер SyncUseCase у фоні
    }
  }
}
```

---

## 8. Залежності між шарами

```
Presentation  ──────►  Domain  ◄──────  Data
  (Cubit)          (UseCase,           (RepoImpl,
  (ViewModel        Repository абстр,   DataSource,
   @freezed)        Entity @freezed,    DTO @freezed,
                    Failure @freezed)   Mapper)
```

- `Presentation` залежить від `Domain` (UseCase, Entity, Failure)
- `Data` залежить від `Domain` (Repository інтерфейс, Entity)
- `Domain` залежить тільки від `freezed_annotation`
- DI (get_it) зв'язує `Data` реалізацію з `Domain` інтерфейсом

---

## 9. SOLID принципи в проекті

### S — Single Responsibility
Кожен клас має одну причину для зміни.

| Клас | Відповідальність |
|------|-----------------|
| `GetVehiclesUseCase` | Отримати список авто |
| `VehicleMapper` | Конвертація DTO ↔ Entity |
| `VehiclesCubit` | Стан сторінки авто |
| `VehiclesPage` | Відображення стану |
| `VehicleDto` | Серіалізація/десеріалізація JSON |

> Якщо клас робить «і X, і Y» — це сигнал розбити на два.

---

### O — Open/Closed
Класи відкриті для розширення, закриті для модифікації.

```dart
// Можна додати FirebaseVehiclesRepository без зміни UseCase
abstract interface class VehiclesRepository { ... }

class SupabaseVehiclesRepository implements VehiclesRepository { ... }
class FirebaseVehiclesRepository implements VehiclesRepository { ... }
```

---

### L — Liskov Substitution
Будь-яка реалізація `Repository` може замінити іншу без поломки UseCase.

```dart
// UseCase не знає, яка реалізація — Supabase чи Firebase
final GetVehiclesUseCase getVehicles = GetVehiclesUseCase(repository);
```

---

### I — Interface Segregation
Не змушуємо клас реалізовувати непотрібні методи.

```dart
abstract interface class VehiclesReadDataSource {
  Future<List<VehicleDto>> getAll();
  Future<VehicleDto> getById(String id);
}

abstract interface class VehiclesWriteDataSource {
  Future<void> save(VehicleDto dto);
  Future<void> delete(String id);
}
```

---

### D — Dependency Inversion
Залежимо від абстракцій, не від реалізацій.

```dart
// ✅ Cubit залежить від UseCase (абстракція), не від Repository чи DataSource
class VehiclesCubit extends Cubit<VehiclesViewModel> {
  VehiclesCubit(this._getVehicles, this._addVehicle);
  final GetVehiclesUseCase _getVehicles;
  final AddVehicleUseCase _addVehicle;
}
```

---

## 10. GoF патерни в проекті

### Creational

| Патерн | Де використовується |
|--------|---------------------|
| **Factory Method** | `VehicleDto.fromJson()` — фабричний конструктор (freezed генерує) |
| **Singleton** | `GetIt` DI-контейнер — один екземпляр на застосунок |
| **Builder** | `state.copyWith(...)` — покроково будує новий стан (freezed генерує `copyWith`) |

---

### Structural

| Патерн | Де використовується |
|--------|---------------------|
| **Repository (Facade)** | `VehiclesRepository` приховує складність Data layer |
| **Adapter** | `VehicleMapper` — адаптує `VehicleDto` до `Vehicle` |
| **Decorator** | Dio interceptors — додають auth/logging без зміни клієнта |
| **Proxy** | `VehiclesRepositoryImpl` — проксі між Domain і DataSource |

---

### Behavioral

| Патерн | Де використовується |
|--------|---------------------|
| **Observer** | `Bloc/Cubit` + `BlocBuilder` — UI реагує на зміни стану |
| **Strategy** | `SyncStrategy` — різна логіка для online/offline синхронізації |
| **Command** | `UseCase` — кожен є командою з `call()` методом |
| **Template Method** | Базовий `UseCase<Type, Params>` — шаблон для всіх UseCase |
| **Chain of Responsibility** | Dio interceptors — ланцюжок обробки запитів |
| **Visitor** | `failure.when(...)` — freezed генерує exhaustive visitor по sealed union |

---

## 11. Clean Code правила

### Іменування

```dart
// ✅ Говорить що робить
Future<Either<Failure, List<Vehicle>>> getActiveVehicles()
bool isOverdue(MaintenanceWork work)
class SignInWithGoogleUseCase

// ❌ Незрозуміло
Future<List> getData()
bool check(Work w)
class GoogleUC
```

---

### Розмір функцій

- Функція — **одна дія**, не більше 20 рядків
- Якщо функція потребує коментаря — витягнути у окрему з хорошою назвою

```dart
// ✅ Читається як prose
Future<void> loadVehicles() async {
  _emitLoading();
  final result = await _getVehicles(NoParams());
  result.fold(_emitFailure, _emitVehicles);
}

void _emitLoading() => emit(state.copyWith(isLoading: true, error: null));
void _emitFailure(Failure f) => emit(state.copyWith(isLoading: false, error: f.when(...)));
void _emitVehicles(List<Vehicle> v) => emit(state.copyWith(isLoading: false, vehicles: v));
```

---

### Без магічних значень

```dart
// ❌
if (daysLeft < 30) status = 'soon';

// ✅
const _soonThresholdDays = 30;
if (daysLeft < _soonThresholdDays) status = MaintenanceStatus.soon;
```

---

### DRY — Don't Repeat Yourself

- Загальні UI-компоненти → `shared/widgets/`
- Загальні UseCase-механізми → `core/usecase/`
- Повторювані маппери не копіювати — виносити у `mappers/`

---

### Обробка помилок

- У `Domain/core` — `@freezed` sealed `Failure`
- У `Repository` — `Either<Failure, T>`
- У `Cubit` — `failure.when(...)` (exhaustive, компілятор перевіряє)
- `Page` відображає `vm.error` — не ловить exceptions

```dart
// core/error/failure.dart
@freezed
sealed class Failure with _$Failure {
  const factory Failure.network(String message) = NetworkFailure;
  const factory Failure.cache(String message) = CacheFailure;
  const factory Failure.auth(String message) = AuthFailure;
  const factory Failure.notFound(String message) = NotFoundFailure;
  const factory Failure.unknown(String message) = UnknownFailure;
}
```

---

## 12. Приклад: фіча Vehicles

Повний шлях від UI до БД для дії «Завантажити список авто»:

```
VehiclesPage
  └─ BlocBuilder<VehiclesCubit, VehiclesViewModel>   // VehiclesViewModel — @freezed
       └─ onInit: context.read<VehiclesCubit>().loadVehicles()
            └─ VehiclesCubit.loadVehicles()
                 └─ GetVehiclesUseCase(NoParams())    // NoParams — @freezed
                      └─ VehiclesRepository.getAll()  ← інтерфейс Domain
                           └─ VehiclesRepositoryImpl   ← реалізація Data
                                ├─ VehiclesLocalDs.getAll()   → drift SQLite
                                └─ _syncIfOnline()            → Supabase (фон)
```

**Потік даних назад:**
```
drift rows
  → List<VehicleDto>          // @freezed + json_serializable
  → VehicleMapper.toEntity()
  → List<Vehicle>             // @freezed entity
  → Right(vehicles)
  → VehiclesCubit._emitVehicles()
  → state.copyWith(vehicles: vehicles)   // copyWith від @freezed
  → BlocBuilder rebuild
  → VehiclesPage відображає список
```

**Обробка помилки:**
```
CacheException
  → Left(Failure.cache(message))    // @freezed sealed union
  → VehiclesCubit._emitFailure()
  → failure.when(cache: (_) => l10n.errorCache, ...)  // exhaustive when
  → state.copyWith(error: message)
  → BlocBuilder rebuild
  → VehiclesPage відображає AppErrorWidget
```

---

> **Головне правило:** якщо не впевнений, куди покласти код —  
> запитай «це бізнес-правило чи UI?»  
> Бізнес → Domain. UI → Presentation. Зовнішнє → Data.
>
> **Freezed правило:** якщо клас immutable і передається між шарами — він має бути `@freezed`.