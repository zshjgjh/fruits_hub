import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruits_hub/core/utilis/save_user_locally.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';

import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';
import 'package:fruits_hub/features/home_view/domain/entities/review_entity.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/products_cubit/products_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/reviews_cubit/get_reviews_cubit/update_reviews_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/reviews_cubit/set_review_cubit/set_review_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/custom_review_field.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/reviews_chart.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/write_review_section.dart';

import 'package:fruits_hub/features/login_view/domain/entities/user_entity.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import 'reviews_list.dart';
import 'review_bar_item.dart';
import 'review_item.dart';

class ReviewsViewBody extends StatefulWidget {
  const ReviewsViewBody({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  State<ReviewsViewBody> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsViewBody> {
  final UserEntity userEntity = getUserDataLocally();
  final TextEditingController controller = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String description = '';
  double avgRating = 0;
  bool isLoading = false;
  ProductEntity? productEntity;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UpdateReviewsCubit>(context).updateReviews();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SetReviewCubit, SetReviewState>(
          listener: (context, state) {
        if (state is SetReviewSuccess) {
          isLoading = false;
          setState(() {});
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(S.of(context).successreview)));
        } else if (state is SetReviewFailure) {
          isLoading = false;
          setState(() {});
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(S.of(context).failreview)));
          print(state.errorMessage);
        } else {
          isLoading = true;
          setState(() {});
        }
      },
        builder: (BuildContext context, state) {
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Form(
                key: key,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 16),
                        child: Column(
                          spacing: 30,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildAppBar(context, title: S.of(context).reviews, isArrowExists: true,onPressed: (){ Navigator.of(context).pop();}),
                            WriteReviewSection(
                                controller: controller,
                                onSaved: (value) {
                                  description = value!;
                                  setState(() {

                                  });
                                },
                                onRatingUpdate: (value) {
                                  avgRating = value;

                                }),
                            CustomButton(
                              title: S.of(context).submitreview,
                              backgroundColor: Styles.primaryColor,
                              borderRadius: 12,
                              titleStyle:
                              Styles.bold19.copyWith(color: Colors.white),
                              height:50,
                                width: double.infinity,
                                onPressed: () {
                                  if (key.currentState!.validate() &&avgRating!=0) {
                                    key.currentState!.save();
                                    ReviewEntity reviewEntity = ReviewEntity(
                                      userID:userEntity.id ,
                                      productID: widget.productEntity.id,
                                      name: userEntity.name,
                                      image: '',
                                      rating: avgRating,
                                      description: description,
                                      date: DateTime.now().toString(),

                                    );

                                    BlocProvider.of<SetReviewCubit>(context)
                                        .setReview(reviewEntity: reviewEntity);

                                    BlocProvider.of<UpdateReviewsCubit>(context)
                                        .updateReviews();
                                    BlocProvider.of<ProductsCubit>(context)
                                        .getProducts();
                                        controller.clear();
                                  } else {
                                    autovalidateMode = AutovalidateMode.always;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(content: Text(S.of(context).rating)));
                                  }
                                },

                                ),

                            ReviewsChart(
                              productEntity:productEntity??widget.productEntity,
                            ),
                          ],
                        ),
                      ),
                    ),
                    reviewsList(productEntity:productEntity??widget.productEntity)
                  ],
                ),
              ),
            );
        },

      ),
    );
  }
}
