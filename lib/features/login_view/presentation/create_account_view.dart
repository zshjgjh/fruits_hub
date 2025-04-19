import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:fruits_hub/features/login_view/presentation/widgets/custom_signin_button.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utilis/app_routers.dart';
import '../../../core/utilis/styles.dart';
import '../../../generated/assets.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'حساب جديد'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              CustomTextField(
                labelText: 'الاسم كامل',
                style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                textInputType: TextInputType.name,
                borderRadius: 4,
              ),
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

              CustomButton(
                  onPressed:(){},
                  title: 'إنشاء حساب جديد',
                  backgroundColor: Styles.primaryColor,
                  borderRadius:16,
                  titleStyle: Styles.bold16.copyWith(color: Colors.white)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Column(
                    children: [
                      Text('من خلال إنشاء حساب ، فإنك توافق على',style: Styles.semiBold13,),
                      GestureDetector(
                          onTap: (){},
                          child: Text(
                            'الشروط والأحكام الخاصة بنا',
                            style: Styles.semiBold13.copyWith(color: Styles.primaryColor),)),

                    ],
                  ),
                  CustomCheckBox(
                      checkedFillColor: Styles.primaryColor,
                      uncheckedFillColor: Colors.white,
                      checkedIcon: Icons.check,
                      checkedIconColor: Colors.white,
                      borderColor: Colors.grey,
                      checkBoxSize: 20,
                      borderRadius: 4,
                      value: isChecked,
                      onChanged:(value) {
                        isChecked = value!;
                        setState(() {

                        });
                      }

                                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: (){
                        GoRouter.of(context).pushReplacement(AppRouters.kLoginView);
                      },
                      child: Text(
                        'تسجيل دخول ',
                        style: Styles.semiBold16.copyWith(color: Styles.primaryColor),)),
                  Text('تمتلك حساب بالفعل؟',style: Styles.semiBold16,),
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}