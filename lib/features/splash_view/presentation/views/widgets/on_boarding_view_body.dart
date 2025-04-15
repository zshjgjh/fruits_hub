import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Image.asset(
            Assets.imagesPinkbg,
            color: Colors.pinkAccent.withOpacity(.15),
          ),
          Positioned(
            top: 50,
            right: 10,
            child: Text(
              'تخط',
              style: Styles.semiBold13.copyWith(color: Color(0xFF949D9E)),
            ),
          ),
          Positioned(
              right: 0,
              left: 0,
              bottom: -60,
              child: Image.asset(Assets.imagesFruitbasket)),
        ]),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' Fruit',
              style: Styles.bold23.copyWith(color: Styles.primaryColor),
            ),
            Text(
              ' Hub ',
              style: Styles.bold23.copyWith(color: Styles.secondaryColor),
            ),
            Text(
              'مرحبًا بك في ',
              style: Styles.bold23,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف  ',
          style: Styles.semiBold13,
        ),
        Text(
          'مجموعتنا الواسعة من الفواكه الطازجة الممتازة',
          style: Styles.semiBold13,
        ),
        Text(
          'واحصل على أفضل العروض والجودة العالية.',
          style: Styles.semiBold13,
        ),

      ],
    );
  }
}
