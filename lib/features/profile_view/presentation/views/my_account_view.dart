import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/save_user_locally.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/payments_view.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/profile_view.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/widgets/account_item.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/widgets/language_notifier.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/widgets/switc_item.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/widgets/theme_notifier.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import 'my_orders_view.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({
    super.key,
  });

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  bool themeValue=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildAppBar(context, title:S.of(context).myaccount, isArrowExists: false),

                    Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius:30,
                            child: Image.asset(Assets.imagesAvatar),
                          ),
                            Positioned(
                              bottom: -10,
                                left: 0,
                                child: IconButton(onPressed: (){}, icon:Icon(Icons.camera_alt_outlined)))
                              ]
                        ),
                        Column(
                          children: [
                            Text(getUserDataLocally().name,style: Styles.bold19,),
                            Text(getUserDataLocally().email,style: Styles.bold19,),
                          ],
                        ),
                      ],
                    ),



                  SizedBox(height: 50,),
                  Text(S.of(context).general,style: Styles.bold19,),
                  SizedBox(height: 20,),
                  AccountItem(title: S.of(context).myprofile, image: Assets.imagesUser,onPressed: (){
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const ProfileView(),
                      withNavBar: true,
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    );
                  },),
                  AccountItem(title: S.of(context).orders, image: Assets.imagesBox,onPressed: (){
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const MyOrdersView(),
                      withNavBar: true,
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    );
                  }),
                  AccountItem(title: S.of(context).payment, image: Assets.imagesEmptywallet,onPressed: (){
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const PaymentView(),
                      withNavBar: true,
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    );
                  }),
                  AccountItem(title: S.of(context).favorite, image: Assets.imagesHeart,onPressed: (){}),
                 SwitchItem(title: S.of(context).notification, image:Assets.imagesNotifications,
                   value: themeValue,
                   onChanged: (bool val) {
                   themeValue=val;
                   setState(() {

                   });}, ),
                  AccountItem(title:S.of(context).language, image: Assets.imagesGlobal,onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        Locale selectedLocale = Provider.of<LanguageProvider>(context, listen: false).locale;
                        return AlertDialog(
                          title: Text(S.of(context).chooselanguge),
                          content: StatefulBuilder(
                            builder: (context, setStateDialog) {
                              return DropdownButton<Locale>(
                                value: selectedLocale,
                                items: const [
                                  DropdownMenuItem(value: Locale('ar'), child: Text('العربية')),
                                  DropdownMenuItem(value: Locale('en'), child: Text('English')),
                                ],
                                onChanged: (locale) {
                                  if (locale != null) {
                                    setStateDialog(() {
                                      selectedLocale = locale;
                                    });
                                    Provider.of<LanguageProvider>(context, listen: false).setLocale(locale);
                                    Navigator.of(context).pop();
                                  }
                                },
                              );
                            },
                          ),
                        );
                      },
                    );

                  }),
                  SwitchItem(title: S.of(context).theme, image: Assets.imagesMagicpen, value:themeValue, onChanged: (bool val) {
                    themeValue=val;
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme(themeValue);
                    setState(() {

                    });},),
                  AccountItem(title: S.of(context).aboutus, image: Assets.imagesInfocircle,onPressed: (){}),
                  Text(S.of(context).support,style: Styles.bold19,),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 70,
              width: double.infinity,
              color: Styles.primaryColor.withOpacity(.2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(S.of(context).logout,style: Styles.bold19.copyWith(color: Styles.primaryColor),),
                    Spacer(),
                    IconButton(onPressed: (){}, icon:Icon(Icons.login_outlined,color: Styles.primaryColor,))
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}