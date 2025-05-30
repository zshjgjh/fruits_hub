import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home_view/domain/repos/reviews_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/product_entity.dart';
import '../../../domain/entities/review_entity.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit({required this.reviewsRepo}) : super(ReviewsInitial());

  final ReviewsRepo reviewsRepo;

  Future<void> setReview({required ReviewEntity reviewEntity}) async {
    emit(ReviewsLoading());
    var result= await reviewsRepo.setReview(reviewEntity: reviewEntity);
    result.fold(
            (faliure){
              emit(ReviewsFailure(errorMessage: faliure.errorMessage.toString()));
            },
        (r){
              emit(ReviewsSuccess(reviewsEntities: []));

    }
    );
  }

  Future<void> getReviews() async {
    emit(ReviewsLoading());
    var result= await reviewsRepo.getReviews();
    result.fold(
            (faliure){
          emit(ReviewsFailure(errorMessage: faliure.errorMessage.toString()));
        },
            (reviewsEntities){
          emit(ReviewsSuccess(reviewsEntities:reviewsEntities));

        }
    );
  }

}
