import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:fruits_hub/features/login_view/presentation/widgets/build_dialog.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';


class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'كلمة مرور جديدة'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 30,
            children: [
              Text('قم بإنشاء كلمة مرور جديدة لتسجيل الدخول',
                style: Styles.semiBold16.copyWith(color: Color(0xFF616A6B)),
                textDirection: TextDirection.rtl,
                maxLines: 2,),

              CustomTextField(
                labelText: 'كلمة مرور جديدة',
                style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                textInputType: TextInputType.text,
                hiddenText: true,
                borderRadius: 4,
              ),
              CustomTextField(
                labelText: 'كلمة مرور جديدة',
                style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                textInputType: TextInputType.text,
                hiddenText: true,
                borderRadius: 4,
              ),


              CustomButton(
                  onPressed:(){
                    buildDialog(context, title: 'Success', dialogType: DialogType.success,);
                  },
                  title: 'إنشاء كلمة مرور جديدة',
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
