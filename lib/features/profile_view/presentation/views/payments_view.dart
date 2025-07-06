import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/add_new_card_view.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/widgets/card_field.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/widgets/custom_edit_field.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          children: [
            buildAppBar(context, title: S.of(context).payment, isArrowExists: true,
            action: Image.asset(Assets.imagesEdit)),
            CustomCardField(suffix: Assets.imagesVisa,),
            CustomCardField(suffix: Assets.imagesMasterCard,),
            Spacer(),
            CustomButton(
                title: S.of(context).addnewpayment,
                height: 55,
                backgroundColor: Styles.primaryColor,
                borderRadius: 16,
                titleStyle: Styles.bold19.copyWith(color: Colors.white),
              onPressed:(){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const AddCardView(),
                  withNavBar: true,
                  pageTransitionAnimation:
                  PageTransitionAnimation.cupertino,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}