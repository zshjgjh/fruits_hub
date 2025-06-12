import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home_view/data/repo_impl/review_repo_impl.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/reviews_cubit/get_reviews_cubit/update_reviews_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/reviews_view_body.dart';

import '../../../../core/utilis/services/supabase/subabase_data_base_service.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/review_entity.dart';
import '../manager/reviews_cubit/set_review_cubit/set_review_cubit.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider<SetReviewCubit>(create: (BuildContext context) {
          return SetReviewCubit(
              reviewsRepo: ReviewsRepoImpl(
                  supaBaseDataBaseService: SupaBaseDataBaseService()));
        }),
        BlocProvider<UpdateReviewsCubit>(create: (BuildContext context) {
          return UpdateReviewsCubit(
              reviewsRepo: ReviewsRepoImpl(
                  supaBaseDataBaseService: SupaBaseDataBaseService()));
        }),
      ],
      child: ReviewsViewBody(
        productEntity: productEntity,
      ),
    ));
  }
}
