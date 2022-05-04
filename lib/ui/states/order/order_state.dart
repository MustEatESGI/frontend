part of 'order_cubit.dart';

@freezed
class OrderState with _$OrderState {
  const OrderState._();
const factory OrderState({
    required bool isLoading,

}) = _OrderState;

factory OrderState.initial() => const OrderState(isLoading: false);
}

