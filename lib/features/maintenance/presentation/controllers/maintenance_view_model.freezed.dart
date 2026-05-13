// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MaintenanceViewModel {
  List<MaintenanceWork> get works => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  WorksTab get activeTab => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;

  /// Create a copy of MaintenanceViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaintenanceViewModelCopyWith<MaintenanceViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceViewModelCopyWith<$Res> {
  factory $MaintenanceViewModelCopyWith(
    MaintenanceViewModel value,
    $Res Function(MaintenanceViewModel) then,
  ) = _$MaintenanceViewModelCopyWithImpl<$Res, MaintenanceViewModel>;
  @useResult
  $Res call({
    List<MaintenanceWork> works,
    bool isLoading,
    WorksTab activeTab,
    String? error,
    String? searchQuery,
  });
}

/// @nodoc
class _$MaintenanceViewModelCopyWithImpl<
  $Res,
  $Val extends MaintenanceViewModel
>
    implements $MaintenanceViewModelCopyWith<$Res> {
  _$MaintenanceViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaintenanceViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? works = null,
    Object? isLoading = null,
    Object? activeTab = null,
    Object? error = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(
      _value.copyWith(
            works: null == works
                ? _value.works
                : works // ignore: cast_nullable_to_non_nullable
                      as List<MaintenanceWork>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            activeTab: null == activeTab
                ? _value.activeTab
                : activeTab // ignore: cast_nullable_to_non_nullable
                      as WorksTab,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            searchQuery: freezed == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MaintenanceViewModelImplCopyWith<$Res>
    implements $MaintenanceViewModelCopyWith<$Res> {
  factory _$$MaintenanceViewModelImplCopyWith(
    _$MaintenanceViewModelImpl value,
    $Res Function(_$MaintenanceViewModelImpl) then,
  ) = __$$MaintenanceViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<MaintenanceWork> works,
    bool isLoading,
    WorksTab activeTab,
    String? error,
    String? searchQuery,
  });
}

/// @nodoc
class __$$MaintenanceViewModelImplCopyWithImpl<$Res>
    extends _$MaintenanceViewModelCopyWithImpl<$Res, _$MaintenanceViewModelImpl>
    implements _$$MaintenanceViewModelImplCopyWith<$Res> {
  __$$MaintenanceViewModelImplCopyWithImpl(
    _$MaintenanceViewModelImpl _value,
    $Res Function(_$MaintenanceViewModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MaintenanceViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? works = null,
    Object? isLoading = null,
    Object? activeTab = null,
    Object? error = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(
      _$MaintenanceViewModelImpl(
        works: null == works
            ? _value._works
            : works // ignore: cast_nullable_to_non_nullable
                  as List<MaintenanceWork>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        activeTab: null == activeTab
            ? _value.activeTab
            : activeTab // ignore: cast_nullable_to_non_nullable
                  as WorksTab,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        searchQuery: freezed == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$MaintenanceViewModelImpl implements _MaintenanceViewModel {
  const _$MaintenanceViewModelImpl({
    final List<MaintenanceWork> works = const [],
    this.isLoading = false,
    this.activeTab = WorksTab.planned,
    this.error,
    this.searchQuery,
  }) : _works = works;

  final List<MaintenanceWork> _works;
  @override
  @JsonKey()
  List<MaintenanceWork> get works {
    if (_works is EqualUnmodifiableListView) return _works;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_works);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final WorksTab activeTab;
  @override
  final String? error;
  @override
  final String? searchQuery;

  @override
  String toString() {
    return 'MaintenanceViewModel(works: $works, isLoading: $isLoading, activeTab: $activeTab, error: $error, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceViewModelImpl &&
            const DeepCollectionEquality().equals(other._works, _works) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.activeTab, activeTab) ||
                other.activeTab == activeTab) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_works),
    isLoading,
    activeTab,
    error,
    searchQuery,
  );

  /// Create a copy of MaintenanceViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceViewModelImplCopyWith<_$MaintenanceViewModelImpl>
  get copyWith =>
      __$$MaintenanceViewModelImplCopyWithImpl<_$MaintenanceViewModelImpl>(
        this,
        _$identity,
      );
}

abstract class _MaintenanceViewModel implements MaintenanceViewModel {
  const factory _MaintenanceViewModel({
    final List<MaintenanceWork> works,
    final bool isLoading,
    final WorksTab activeTab,
    final String? error,
    final String? searchQuery,
  }) = _$MaintenanceViewModelImpl;

  @override
  List<MaintenanceWork> get works;
  @override
  bool get isLoading;
  @override
  WorksTab get activeTab;
  @override
  String? get error;
  @override
  String? get searchQuery;

  /// Create a copy of MaintenanceViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaintenanceViewModelImplCopyWith<_$MaintenanceViewModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
