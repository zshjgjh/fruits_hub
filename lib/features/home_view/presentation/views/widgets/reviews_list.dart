import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home_view/data/models/review-model.dart';
import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';
import 'package:fruits_hub/features/home_view/domain/entities/review_entity.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/review_item.dart';

import '../../manager/products_cubit/products_cubit.dart';
import '../../manager/reviews_cubit/get_reviews_cubit/update_reviews_cubit.dart';

BlocConsumer<UpdateReviewsCubit, UpdateReviewsState> reviewsList({required ProductEntity productEntity}) {
  List<ReviewEntity> reviews = [];


  return BlocConsumer<UpdateReviewsCubit, UpdateReviewsState>(
    listener: (context, state) {
      if (state is UpdateReviewsSuccess) {
        reviews=state.reviews;
      } else if (state is UpdateReviewsFailure) {
      } else {}
    },
    builder: (context, state) {
      return SliverList(
          delegate: SliverChildBuilderDelegate(childCount: reviews.length,
              (context, index) {
        return reviews.isEmpty?SizedBox() :ReviewItem(
          reviewEntity: reviews[index],
          onPressed: () {
              BlocProvider.of<UpdateReviewsCubit>(context).deleteReviews(reviewEntity:reviews[index]);
              BlocProvider.of<UpdateReviewsCubit>(context).updateReviews();
              BlocProvider.of<ProductsCubit>(context)
                  .getProducts(context);

        },
        );
      }));
    },
  );
}
