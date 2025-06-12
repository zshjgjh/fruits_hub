import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/reviews_cubit/get_reviews_cubit/update_reviews_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/reviews_cubit/get_reviews_cubit/update_reviews_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/reviews_cubit/set_review_cubit/set_review_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/review_bar_item.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/custom_review_field.dart';
import '../../../../../core/utilis/styles.dart';

class WriteReviewSection extends StatelessWidget {
const WriteReviewSection({super.key, required this.onSaved,required this.onRatingUpdate, this.controller});

@override

final void Function(String?)? onSaved;
final void Function(double) onRatingUpdate;
final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetReviewCubit, SetReviewState>(
      builder: (context, state) {
        return Column(
          spacing: 10,
          children: [
            CustomReviewField(
              controller:controller ,
                maxLines: 2,
                labelText: 'write review',
                borderRadius: 10,
                style: Styles.bold19,
                onSaved:onSaved,),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
                  Icon(
                    Icons.star,
                    color:state is SetReviewSuccess || state is SetReviewFailure?Colors.grey: Colors.amber,
                  ),
              onRatingUpdate:onRatingUpdate
            ),
          ],
        );
      },
    );
  }
}