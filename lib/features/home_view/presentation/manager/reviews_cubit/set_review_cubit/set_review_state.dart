part of 'set_review_cubit.dart';

@immutable
sealed class SetReviewState {}

final class SetReviewInitial extends SetReviewState {}

final class SetReviewLoading extends SetReviewState {}

final class SetReviewFailure extends SetReviewState {
  final String errorMessage;

  SetReviewFailure({required this.errorMessage});
}

final class SetReviewSuccess extends SetReviewState {}
