import 'package:dots_indicator/dots_indicator.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/splash_view/presentation/views/widgets/page_view_item_first.dart';
import 'package:fruits_hub/features/splash_view/presentation/views/widgets/page_view_item_second.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {

  late  PageController pageController;
  int currentIndex=0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      setState(() {

      });
    });
  }
  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
       Expanded(
         child: PageView(
           scrollDirection: Axis.horizontal,
           controller: pageController,
           children: [
            // PageViewItemFirst(),
             PageViewItemSecond()
           ],
         ),
       ),

        DotsIndicator(
          dotsCount: 2,
          position: currentIndex.toDouble(),
          decorator: DotsDecorator(
              size: Size(10, 10),
              activeSize: Size(13, 13),
              activeColor: Styles.primaryColor,
              color: Styles.primaryColor.withOpacity(.2)),
        ),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: true ,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 8),
            child: CustomButton(
                onPressed: (){},
                title: 'ابدأ الان',
                backgroundColor: Styles.primaryColor,
                borderRadius: 16,
                titleStyle: Styles.bold16.copyWith(color: Color(0xFFFFFFFF))
            ),
          ),
        ),




      ],
    );
  }
}
