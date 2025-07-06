import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/reviews_cubit/get_reviews_cubit/update_reviews_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/reviews_cubit/get_reviews_cubit/update_reviews_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/review_bar_item.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/reviews_view_body.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/entities/review_entity.dart';

class ReviewsChart extends StatefulWidget {
  const ReviewsChart({
    super.key,
    required this.productEntity
  });


  final ProductEntity productEntity;

  @override
  State<ReviewsChart> createState() => _ReviewsChartState();
}

class _ReviewsChartState extends State<ReviewsChart> {

   List<ReviewEntity> reviews=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateReviewsCubit, UpdateReviewsState>(
      listener: (context, state) {
        if (state is UpdateReviewsSuccess) {
          reviews=state.reviews;

        } else if (state is UpdateReviewsFailure) {
        } else {}
      },
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    '${widget.productEntity.ratingCount} ${S.of(context).reviews}',
                    style: Styles.bold19,
                  ),
                  ReviewBarItem(
                    title: '5',
                    value:reviews.isEmpty?0: calculateReviewsValue(
                        reviews: reviews,
                        value: 5,
                        productEntity: widget.productEntity),
                  ),
                  ReviewBarItem(
                    title: '4',
                    value:reviews.isEmpty?0: calculateReviewsValue(
                        reviews: reviews,
                        value: 4,
                        productEntity: widget.productEntity),
                  ),
                  ReviewBarItem(
                    title: '3',
                    value:reviews.isEmpty?0: calculateReviewsValue(
                        reviews:reviews,
                        value: 3,
                        productEntity: widget.productEntity),
                  ),
                  ReviewBarItem(
                    title: '2',
                    value:reviews.isEmpty?0: calculateReviewsValue(
                        reviews:reviews,
                        value: 2,
                        productEntity: widget.productEntity),
                  ),
                  ReviewBarItem(
                    title: '1',
                    value:reviews.isEmpty?0: calculateReviewsValue(
                        reviews:reviews,
                        value: 1,
                        productEntity: widget.productEntity),
                  ),
                ],
              ),
            ),
            Image.asset(Assets.imagesStar),
            Text(
              widget.productEntity.avgRating.toStringAsFixed(1),
              style: Styles.bold19,
            ),

          ],
        );
      },
    );
  }
}