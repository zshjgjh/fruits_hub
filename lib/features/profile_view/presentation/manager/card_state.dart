part of 'card_cubit.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

final class CardLoading extends CardState {}

final class CardSuccess extends CardState {
  final List<CardModel> cards;

  CardSuccess({required this.cards});
}

final class CardFailure extends CardState {
  final String errorMessage;

  CardFailure({required this.errorMessage});
}
