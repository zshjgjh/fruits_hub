import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilis/styles.dart';

void buildDialog(BuildContext context,{required String title,required DialogType dialogType}) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: dialogType,
    body: Text(
      title, style: Styles.bold19.copyWith(color: Styles.primaryColor),),
    btnOkOnPress: () {},
  ).show();
}