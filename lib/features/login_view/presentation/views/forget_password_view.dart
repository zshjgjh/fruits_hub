import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).forgetPassword, isArrowExists: true,onPressed: (){ Navigator.of(context).pop();}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              Text(S.of(context).dontworry,
                style: Styles.semiBold16.copyWith(color: Color(0xFF616A6B)),
                textDirection: TextDirection.rtl,
              maxLines: 2,),

              CustomTextField(
                labelText: S.of(context).phonenumber,
                style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                textInputType: TextInputType.phone,
                borderRadius: 4,
              ),


              CustomButton(
                  onPressed:(){
                    GoRouter.of(context).pushReplacement(AppRouters.kCheckCode);
                  },
                  title: S.of(context).forgetPassword,
                  backgroundColor: Styles.primaryColor,
                  borderRadius:16,
                  titleStyle: Styles.bold16.copyWith(color: Colors.white),
                width: double.infinity,
                height: 54,
              ),


            ],
          ),
        ),
      ),
    );
  }
}