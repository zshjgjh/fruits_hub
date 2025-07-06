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
import '../../../../generated/l10n.dart';


class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).newPassword, isArrowExists: true,onPressed: (){ PersistentNavBarNavigator.pop(context);}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              Text(S.of(context).createnewaccount,
                style: Styles.semiBold16.copyWith(color: Color(0xFF616A6B)),
                textDirection: TextDirection.rtl,
                maxLines: 2,),

              CustomTextField(
                labelText: S.of(context).newPassword,
                style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                textInputType: TextInputType.text,
                hiddenText: true,
                borderRadius: 4,
              ),
              CustomTextField(
                labelText: S.of(context).newPassword,
                style: Styles.bold13.copyWith(color: Color(0xFF949D9E)),
                textInputType: TextInputType.text,
                hiddenText: true,
                borderRadius: 4,
              ),


              CustomButton(
                  onPressed:(){
                    AwesomeDialog(context:context,title: S.of(context).success,dialogType:DialogType.success );
                  },
                  title: S.of(context).createpassword,
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
