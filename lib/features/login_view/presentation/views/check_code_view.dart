import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class CheckCodeView extends StatelessWidget {
  const CheckCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).checkCode, isArrowExists: true,onPressed: (){ Navigator.of(context).pop();}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Text(S.of(context).enterCode,
                style: Styles.semiBold16.copyWith(color: Color(0xFF616A6B)),

                maxLines: 2,),

              Row(
                spacing: 5,
                children: [
                  Expanded(
                    child:
                      CustomTextField(
                        style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                        textInputType: TextInputType.number,
                        borderRadius: 4,
                      ),

                  ),
                  Expanded(
                    child:
                    CustomTextField(
                      style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                      textInputType: TextInputType.number,
                      borderRadius: 4,
                    ),

                  ),
                  Expanded(
                    child:
                    CustomTextField(
                      style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                      textInputType: TextInputType.number,
                      borderRadius: 4,
                    ),

                  ),
                  Expanded(
                    child:
                    CustomTextField(
                      style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                      textInputType: TextInputType.number,
                      borderRadius: 4,
                    ),

                  ),
                ],
              ),


              CustomButton(
                  onPressed:(){
                    GoRouter.of(context).pushReplacement(AppRouters.kNewPassword);
                  },
                  title: S.of(context).checkCode,
                  backgroundColor: Styles.primaryColor,
                  borderRadius:16,
                  titleStyle: Styles.bold16.copyWith(color: Colors.white),
                width: double.infinity,
                height: 54,
              ),

              Center(
                child: Text(S.of(context).resendcode,
                  style: Styles.semiBold16.copyWith(color: Styles.primaryColor),
                  maxLines: 2,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}