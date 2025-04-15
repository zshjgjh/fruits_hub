import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utilis/styles.dart';

AppBar buildAppBar(BuildContext context,{String? action,required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
      title,
      style: Styles.bold19,
    ),
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 46,
        backgroundColor: const Color(0xFFF1F1F5),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 44,
          child: Center(
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
      ),
    ),
    actions: [
     action==null?const SizedBox() :Image.asset(action)
    ],
  );
}