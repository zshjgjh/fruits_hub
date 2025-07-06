import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class PageViewItemSecond extends StatelessWidget {
  const PageViewItemSecond({super.key});

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
                  fit: BoxFit.fill,
                  Assets.imagesGreenbg,
                ),
              ),

              Positioned(
                  right: 0,
                  left: 0,
                  bottom: -60,
                  child: Image.asset(Assets.imagesPineapple)),
            ]),
        Spacer(flex: 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              S.of(context).searchandShop,
              style: Styles.bold23,
            ),
          ],
        ),
        Spacer(flex: 1,),
        Text(
          S.of(context).splash2,
          style: Styles.bold23,
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
