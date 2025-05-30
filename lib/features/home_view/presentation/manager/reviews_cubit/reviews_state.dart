part of 'reviews_cubit.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsFailure extends ReviewsState {
  final String errorMessage;

  ReviewsFailure({required this.errorMessage});
}

final class ReviewsSuccess extends ReviewsState {
  final List<ReviewEntity> reviewsEntities;

  ReviewsSuccess({required this.reviewsEntities});
}
