import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home_view/domain/entities/review_entity.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key, required this.reviewEntity,
  });
final ReviewEntity reviewEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                  children:[
                    CircleAvatar(
                      radius: 30,
                      child: Image.asset(Assets.imagesReviewIcon,fit: BoxFit.cover,),
                    ),
                    Positioned(
                      left: 40,
                      bottom: 5 ,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Color(0xffFFB400),
                        child: Text('5',style: Styles.semiBold11.copyWith(color: Colors.white),),
                      ),
                    )
                  ]
              ),
              Expanded(
                child: ListTile(
                  title: Text(reviewEntity.name,style: Styles.semiBold16,),
                  subtitle: Text(reviewEntity.date,style: Styles.regular13.copyWith(color: Color(0xff949D9E))),
                ),
              ),
            ],
          ),
          Text(reviewEntity.description,style:Styles.regular13.copyWith(color: Color(0xff949D9E)) ,)
        ],
      ),
    );
  }
}