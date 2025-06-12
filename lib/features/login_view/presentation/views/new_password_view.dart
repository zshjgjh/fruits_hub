import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';

import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';


class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'New password', isArrowExists: true,onPressed: (){ PersistentNavBarNavigator.pop(context);}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              Text('Create a new password to sign in',
                style: Styles.semiBold16.copyWith(color: Color(0xFF616A6B)),
                textDirection: TextDirection.rtl,
                maxLines: 2,),

              CustomTextField(
                labelText: 'New password',
                style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                textInputType: TextInputType.text,
                hiddenText: true,
                borderRadius: 4,
              ),
              CustomTextField(
                labelText: 'New password',
                style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                textInputType: TextInputType.text,
                hiddenText: true,
                borderRadius: 4,
              ),


              CustomButton(
                  onPressed:(){
                    AwesomeDialog(context:context,title: 'Success',dialogType:DialogType.success );
                  },
                  title: 'Create new password',
                  backgroundColor: Styles.primaryColor,
                  borderRadius:16,
                  titleStyle: Styles.bold16.copyWith(color: Colors.white),
                width: double.infinity,
                height:54,
              ),


            ],
          ),
        ),
      ),
    );
  }


  }
