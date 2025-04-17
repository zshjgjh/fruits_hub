import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class PageViewItemFirst extends StatelessWidget {
  const PageViewItemFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  Assets.imagesPinkbg,
                  fit: BoxFit.fill,
                  color: Colors.pinkAccent.withOpacity(.15),
                ),
              ),
              Positioned(
                top: 30,
                right: 15,
                child: GestureDetector(
                  onTap: (){

                  },
                  child: GestureDetector(
                    onTap: (){
                      GoRouter.of(context).pushReplacement(AppRouters.kLoginView);
                    },
                    child: Text(
                      'تخط',
                      style: Styles.semiBold13.copyWith(color: Color(0xFF949D9E)),
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  left: 0,
                  bottom: -60,
                  child: Image.asset(Assets.imagesFruitbasket)),
            ]),
        Spacer(flex: 2,),
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
        Spacer(flex: 1,),
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
        Spacer(flex: 7,)


      ],
    );
  }
}
