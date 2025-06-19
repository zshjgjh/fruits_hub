part of 'set_orders_cubit.dart';

@immutable
sealed class SetOrdersState {}

final class SetOrdersInitial extends SetOrdersState {}

final class SetOrdersLoading extends SetOrdersState {}

final class SetOrdersFailure extends SetOrdersState {
  final String errorMessage;

  SetOrdersFailure({required this.errorMessage});
}

final class SetOrdersSuccess extends SetOrdersState {

}

final class SetOrderAddressSuccess extends SetOrdersState {

}
