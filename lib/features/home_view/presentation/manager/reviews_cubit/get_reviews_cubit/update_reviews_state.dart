part of 'update_reviews_cubit.dart';

@immutable
sealed class UpdateReviewsState {}

final class UpdateReviewsInitial extends UpdateReviewsState {}

final class UpdateReviewsLoading extends UpdateReviewsState {}

final class UpdateReviewsSuccess extends UpdateReviewsState {
  final List<ReviewEntity> reviews;

  UpdateReviewsSuccess({required this.reviews});
}

final class UpdateReviewsFailure extends UpdateReviewsState {
  final String errorMessage;

  UpdateReviewsFailure({required this.errorMessage});
}
