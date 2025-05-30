import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/cart_view/data/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/product_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/build_bottom_bar.dart';
import '../../../../cart_view/presentation/manager/cart_cubit.dart';
import 'review_item.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/entities/review_entity.dart';
import '../../manager/products_cubit/products_cubit.dart';
import '../product_detail_view.dart';

BlocBuilder<ReviewsCubit, ReviewsState> reviewsBlocBuilder() {

  return BlocBuilder<ReviewsCubit, ReviewsState>(
    builder: (context, state) {
      if(state is ReviewsSuccess) {
        List<ReviewEntity> reviewsEntities = state.reviewsEntities;
        return  SliverList(
            delegate:
            SliverChildBuilderDelegate(childCount: reviewsEntities.length,
                    (context, index) {
              return ReviewItem(reviewEntity: reviewsEntities[index],);
            }));
      }else if(state is ReviewsFailure){
        print(state.errorMessage.toString());
        return SliverToBoxAdapter(child: Text(state.errorMessage.toString()));
      }else {
        return SliverToBoxAdapter(child: Text('loading'));
      }
    },
  );
}
