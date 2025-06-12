import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home_view/domain/repos/reviews_repo.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/product_entity.dart';
import '../../../../domain/entities/review_entity.dart';

part 'set_review_state.dart';

class SetReviewCubit extends Cubit<SetReviewState> {
  SetReviewCubit({required this.reviewsRepo}) : super(SetReviewInitial());

  final ReviewsRepo reviewsRepo;

  Future<void> setReview({required ReviewEntity reviewEntity}) async {
    emit(SetReviewLoading());
    var result= await reviewsRepo.setReview(reviewEntity: reviewEntity);
    result.fold(
            (faliure){
              emit(SetReviewFailure(errorMessage: faliure.errorMessage.toString()));
            },
        (r){
              emit(SetReviewSuccess());

    }
    );
  }



}
