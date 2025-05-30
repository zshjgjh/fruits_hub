import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruits_hub/core/utilis/save_user_locally.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';

import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';
import 'package:fruits_hub/features/home_view/domain/entities/review_entity.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/review_field.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/reviews_bloc_builder.dart';
import 'package:fruits_hub/features/login_view/domain/entities/user_entity.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';
import 'widgets/review_bar_item.dart';
import 'widgets/review_item.dart';

class ReviewsView extends StatefulWidget {
  const ReviewsView({super.key, required this.productEntity});

  final ProductEntity productEntity;
  @override
  State<ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsView> {
  final UserEntity userEntity = getUserDataLocally();

  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  double rating = 0;
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: Column(
                  spacing: 30,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildAppBar(context, title: 'Reviews'),
                    CustomReviewField(
                        maxLines: 2,
                        labelText: 'write review',
                        borderRadius: 10,
                        style: Styles.bold19,
                        onSaved: (value) {
                          description = value!;
                          setState(() {});
                        }),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        rating = rating;
                        setState(() {});
                      },
                    ),
                    CustomButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            key.currentState!.save();
                            ReviewEntity reviewEntity = ReviewEntity(
                              productID: widget.productEntity.productID,
                              name: userEntity.name,
                              image: '',
                              avgRating: rating,
                              description: description,
                              date: DateTime.now().toString(),
                            );
                            BlocProvider.of<ReviewsCubit>(context)
                                .setReview(reviewEntity: reviewEntity);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        title: 'Submit Review',
                        backgroundColor: Styles.primaryColor,
                        borderRadius: 4,
                        titleStyle: Styles.bold19.copyWith(color: Colors.white),
                        height: 30),
                    Text(
                      '340 Reviews',
                      style: Styles.bold19,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ReviewBarItem(),
                              ReviewBarItem(),
                              ReviewBarItem(),
                              ReviewBarItem(),
                            ],
                          ),
                        ),
                        Text(
                          '4.5',
                          style: Styles.bold19,
                        ),
                        Image.asset(Assets.imagesStar)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            reviewsBlocBuilder()
          ],
        ),
      ),
    );
  }
}
