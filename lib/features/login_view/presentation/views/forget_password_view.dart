import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'نسيت كلمة المرور'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 30,
            children: [
              Text('لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.؟',
                style: Styles.semiBold16.copyWith(color: Color(0xFF616A6B)),
                textDirection: TextDirection.rtl,
              maxLines: 2,),

              CustomTextField(
                labelText: 'رقم الهاتف',
                style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                textInputType: TextInputType.phone,
                borderRadius: 4,
              ),


              CustomButton(
                  onPressed:(){
                    GoRouter.of(context).pushReplacement(AppRouters.kCheckCode);
                  },
                  title: 'نسيت كلمة المرور',
                  backgroundColor: Styles.primaryColor,
                  borderRadius:16,
                  titleStyle: Styles.bold16.copyWith(color: Colors.white)
              ),


            ],
          ),
        ),
      ),
    );
  }
}