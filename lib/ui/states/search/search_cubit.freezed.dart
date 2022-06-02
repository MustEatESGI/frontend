// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isTrendy => throw _privateConstructorUsedError;
  List<Restaurant>? get restaurants => throw _privateConstructorUsedError;
  List<Meal>? get meals => throw _privateConstructorUsedError;
  Restaurant? get restaurant => throw _privateConstructorUsedError;
  String get filter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isTrendy,
      List<Restaurant>? restaurants,
      List<Meal>? meals,
      Restaurant? restaurant,
      String filter});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isTrendy = freezed,
    Object? restaurants = freezed,
    Object? meals = freezed,
    Object? restaurant = freezed,
    Object? filter = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTrendy: isTrendy == freezed
          ? _value.isTrendy
          : isTrendy // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurants: restaurants == freezed
          ? _value.restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>?,
      meals: meals == freezed
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>?,
      restaurant: restaurant == freezed
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant?,
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) then) =
      __$SearchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isTrendy,
      List<Restaurant>? restaurants,
      List<Meal>? meals,
      Restaurant? restaurant,
      String filter});
}

/// @nodoc
class __$SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(
      _SearchState _value, $Res Function(_SearchState) _then)
      : super(_value, (v) => _then(v as _SearchState));

  @override
  _SearchState get _value => super._value as _SearchState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isTrendy = freezed,
    Object? restaurants = freezed,
    Object? meals = freezed,
    Object? restaurant = freezed,
    Object? filter = freezed,
  }) {
    return _then(_SearchState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTrendy: isTrendy == freezed
          ? _value.isTrendy
          : isTrendy // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurants: restaurants == freezed
          ? _value.restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>?,
      meals: meals == freezed
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>?,
      restaurant: restaurant == freezed
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant?,
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchState extends _SearchState {
  const _$_SearchState(
      {required this.isLoading,
      required this.isTrendy,
      final List<Restaurant>? restaurants,
      final List<Meal>? meals,
      this.restaurant,
      required this.filter})
      : _restaurants = restaurants,
        _meals = meals,
        super._();

  @override
  final bool isLoading;
  @override
  final bool isTrendy;
  final List<Restaurant>? _restaurants;
  @override
  List<Restaurant>? get restaurants {
    final value = _restaurants;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Meal>? _meals;
  @override
  List<Meal>? get meals {
    final value = _meals;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Restaurant? restaurant;
  @override
  final String filter;

  @override
  String toString() {
    return 'SearchState(isLoading: $isLoading, isTrendy: $isTrendy, restaurants: $restaurants, meals: $meals, restaurant: $restaurant, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isTrendy, isTrendy) &&
            const DeepCollectionEquality()
                .equals(other.restaurants, restaurants) &&
            const DeepCollectionEquality().equals(other.meals, meals) &&
            const DeepCollectionEquality()
                .equals(other.restaurant, restaurant) &&
            const DeepCollectionEquality().equals(other.filter, filter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isTrendy),
      const DeepCollectionEquality().hash(restaurants),
      const DeepCollectionEquality().hash(meals),
      const DeepCollectionEquality().hash(restaurant),
      const DeepCollectionEquality().hash(filter));

  @JsonKey(ignore: true)
  @override
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);
}

abstract class _SearchState extends SearchState {
  const factory _SearchState(
      {required final bool isLoading,
      required final bool isTrendy,
      final List<Restaurant>? restaurants,
      final List<Meal>? meals,
      final Restaurant? restaurant,
      required final String filter}) = _$_SearchState;
  const _SearchState._() : super._();

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isTrendy => throw _privateConstructorUsedError;
  @override
  List<Restaurant>? get restaurants => throw _privateConstructorUsedError;
  @override
  List<Meal>? get meals => throw _privateConstructorUsedError;
  @override
  Restaurant? get restaurant => throw _privateConstructorUsedError;
  @override
  String get filter => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
