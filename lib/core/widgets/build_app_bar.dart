import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../generated/assets.dart';
import '../utilis/styles.dart';

AppBar buildAppBar(BuildContext context, {String? action, required String title,Widget? leading}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    leading: leading,
    title: Text(
      title,
      style: Styles.bold19,
    ),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircleAvatar(
          radius: 19,
          backgroundColor:  Colors.grey.withOpacity(.2),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(.8),
            radius: 18,
            child: Center(
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
