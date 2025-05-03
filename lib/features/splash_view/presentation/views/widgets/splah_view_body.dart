

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/utilis/constants.dart';
import 'package:fruits_hub/core/utilis/services/fire_base/fire_auth_service.dart';
import 'package:fruits_hub/core/utilis/shared_prefrences.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
 @override
  void initState(){
   navigation();
     super.initState();
 }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
              child: Image.asset('assets/images/leaf.png')),

          Image.asset('assets/images/logo.png'),

          Image.asset('assets/images/circles.png',fit: BoxFit.fill,),

        ],
      );

  }
 void navigation() {
   bool isOnBoardingSeen=SharedPreferencesSingelton.getBool(kIsOnBoardingViewSeen);


     Future.delayed((Duration(milliseconds: 5)),
             () {
               var isUserSignin=FireAuthService().isUserSignin();
               if (isOnBoardingSeen==true) {
                 if(isUserSignin ==true){
                   GoRouter.of(context).push(AppRouters.kHomeView);
                 }else{
                   GoRouter.of(context).push(AppRouters.kLoginView);
                 }
               } else{
                 GoRouter.of(context).push(AppRouters.kBoardingView);
               }
         });

 }

}