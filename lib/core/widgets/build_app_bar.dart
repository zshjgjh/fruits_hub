import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../generated/assets.dart';
import '../utilis/styles.dart';

AppBar buildAppBar(BuildContext context, {void Function()? onPressed, required String title,Widget? action,required bool isArrowExists}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    leading:isArrowExists? Padding(
      padding: const EdgeInsets.all(2.0),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back_ios),
      ),
    ):SizedBox(),
    title: Text(
      title,
      style: Styles.bold19,
    ),
    centerTitle: true,
    actions: [
      action??SizedBox()
    ],
  );
}
