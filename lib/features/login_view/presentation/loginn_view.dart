import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:fruits_hub/features/login_view/presentation/widgets/custom_signin_button.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utilis/styles.dart';
import '../../../generated/assets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل الدخول'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              CustomTextField(
                labelText: 'البريد الالكتروني',
                style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                textInputType: TextInputType.emailAddress,
                borderRadius: 4,
              ),
              CustomTextField(
                labelText: 'كلمة المرور',
                style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                hiddenText: true,
                textInputType: TextInputType.text,
                borderRadius: 4,
              ),
               Text('نسيت كلمة المرور؟',style: Styles.semiBold13.copyWith(color: Styles.primaryColor),),
              CustomButton(
                  onPressed:(){},
                  title: 'تسجيل دخول',
                  backgroundColor: Styles.primaryColor,
                  borderRadius:16,
                  titleStyle: Styles.bold16.copyWith(color: Colors.white)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      GoRouter.of(context).pushReplacement(AppRouters.kCreateAccount);
                    },
                      child: Text(
                        'قم بانشاء حساب',
                        style: Styles.semiBold16.copyWith(color: Styles.primaryColor),)),
                  Text('لا تمتلك حساب؟',style: Styles.semiBold16,),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(thickness: 2,color: Color(0xFFDDDFDF),)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('أو', style: Styles.semiBold16),
                  ),
                  Expanded(
                      child: Divider(thickness: 2,color: Color(0xFFDDDFDF),)),
                ],
              ),
              CustomSigninButton(
                  onPressed: (){},
                  title: 'تسجيل بواسطة ابل',
                  borderRadius: 16,
                  titleStyle: Styles.semiBold16,
                  leading: Assets.imagesApple,
                backgroundColor: Colors.transparent,
                borderColor: Color(0xFFDDDFDF),
              ),
              CustomSigninButton(
                onPressed: (){},
                title: 'تسجيل بواسطة جوجل',
                borderRadius: 16,
                titleStyle: Styles.semiBold16,
                leading: Assets.imagesGmail,
                backgroundColor: Colors.transparent,
                borderColor: Color(0xFFDDDFDF),
              ),
              CustomSigninButton(
                onPressed: (){},
                title: 'تسجيل بواسطة فيسبوك',
                borderRadius: 16,
                titleStyle: Styles.semiBold16,
                leading: Assets.imagesFacebook,
                backgroundColor: Colors.transparent,
                borderColor: Color(0xFFDDDFDF),
              )

            ],
          ),
        ),
      ),
    );
  }
}