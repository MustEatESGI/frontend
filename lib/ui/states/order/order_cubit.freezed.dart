// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderState {
  bool get isLoading => throw _privateConstructorUsedError;
  Command? get command => throw _privateConstructorUsedError;
  List<Meal>? get meals => throw _privateConstructorUsedError;
  String get totalPrice => throw _privateConstructorUsedError;
  bool get isPaid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderStateCopyWith<OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      Command? command,
      List<Meal>? meals,
      String totalPrice,
      bool isPaid});
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res> implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  final OrderState _value;
  // ignore: unused_field
  final $Res Function(OrderState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? command = freezed,
    Object? meals = freezed,
    Object? totalPrice = freezed,
    Object? isPaid = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      command: command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as Command?,
      meals: meals == freezed
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>?,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: isPaid == freezed
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$OrderStateCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory _$OrderStateCopyWith(
          _OrderState value, $Res Function(_OrderState) then) =
      __$OrderStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      Command? command,
      List<Meal>? meals,
      String totalPrice,
      bool isPaid});
}

/// @nodoc
class __$OrderStateCopyWithImpl<$Res> extends _$OrderStateCopyWithImpl<$Res>
    implements _$OrderStateCopyWith<$Res> {
  __$OrderStateCopyWithImpl(
      _OrderState _value, $Res Function(_OrderState) _then)
      : super(_value, (v) => _then(v as _OrderState));

  @override
  _OrderState get _value => super._value as _OrderState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? command = freezed,
    Object? meals = freezed,
    Object? totalPrice = freezed,
    Object? isPaid = freezed,
  }) {
    return _then(_OrderState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      command: command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as Command?,
      meals: meals == freezed
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>?,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: isPaid == freezed
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OrderState extends _OrderState {
  const _$_OrderState(
      {required this.isLoading,
      this.command,
      final List<Meal>? meals,
      required this.totalPrice,
      required this.isPaid})
      : _meals = meals,
        super._();

  @override
  final bool isLoading;
  @override
  final Command? command;
  final List<Meal>? _meals;
  @override
  List<Meal>? get meals {
    final value = _meals;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String totalPrice;
  @override
  final bool isPaid;

  @override
  String toString() {
    return 'OrderState(isLoading: $isLoading, command: $command, meals: $meals, totalPrice: $totalPrice, isPaid: $isPaid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality().equals(other.meals, meals) &&
            const DeepCollectionEquality()
                .equals(other.totalPrice, totalPrice) &&
            const DeepCollectionEquality().equals(other.isPaid, isPaid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(meals),
      const DeepCollectionEquality().hash(totalPrice),
      const DeepCollectionEquality().hash(isPaid));

  @JsonKey(ignore: true)
  @override
  _$OrderStateCopyWith<_OrderState> get copyWith =>
      __$OrderStateCopyWithImpl<_OrderState>(this, _$identity);
}

abstract class _OrderState extends OrderState {
  const factory _OrderState(
      {required final bool isLoading,
      final Command? command,
      final List<Meal>? meals,
      required final String totalPrice,
      required final bool isPaid}) = _$_OrderState;
  const _OrderState._() : super._();

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Command? get command => throw _privateConstructorUsedError;
  @override
  List<Meal>? get meals => throw _privateConstructorUsedError;
  @override
  String get totalPrice => throw _privateConstructorUsedError;
  @override
  bool get isPaid => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderStateCopyWith<_OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
