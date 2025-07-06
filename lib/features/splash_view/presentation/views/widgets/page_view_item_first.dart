import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilis/constants.dart';
import '../../../../../core/utilis/shared_prefrences.dart';
import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

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
                      SharedPreferencesSingelton.setBool(kIsOnBoardingViewSeen, true);
                      GoRouter.of(context).pushReplacement(AppRouters.kLoginView);
                    },
                    child: Text(
                      S.of(context).skip,
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
              S.of(context).welcometo,
              style: Styles.bold23.copyWith(color: Styles.primaryColor),
            ),
            Text(
              ' Fruit',
              style: Styles.bold23.copyWith(color: Styles.primaryColor),
            ),
            Text(
              ' Hub ',
              style: Styles.bold23.copyWith(color: Styles.secondaryColor),
            ),

          ],
        ),
        Spacer(flex: 1,),
        Text(S.of(context).splash1,
          style: Styles.bold16,
          overflow: TextOverflow.visible,
          softWrap: true,
          maxLines: 8,
          textAlign: TextAlign.center,
        ),

        Spacer(flex: 7,)


      ],
    );
  }
}
