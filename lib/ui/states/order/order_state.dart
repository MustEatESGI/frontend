part of 'order_cubit.dart';

@freezed
class OrderState with _$OrderState {
  const OrderState._();

  const factory OrderState({
    required bool isLoading,
    Command? command,
    List<Meal>? meals,
    required String totalPrice,
    required bool isPaid,
  }) = _OrderState;

  factory OrderState.initial() =>
      const OrderState(isLoading: false, totalPrice: "00.00", isPaid: false);
}
