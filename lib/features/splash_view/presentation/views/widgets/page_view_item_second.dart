import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

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
              'ابحث وتسوق',
              style: Styles.bold23,
            ),
          ],
        ),
        Spacer(flex: 1,),
        Text(
          'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على   ',
          style: Styles.semiBold13,
        ),
        Text(
          'التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة ',
          style: Styles.semiBold13,
        ),
        Text(
          'المثالية',
          style: Styles.semiBold13,
        ),
        Spacer(flex: 7,)


      ],
    );
  }
}
