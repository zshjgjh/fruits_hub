import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utilis/styles.dart';

AppBar buildAppBar(BuildContext context,
    {String? action, required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
      title,
      style: Styles.bold19,
    ),
    centerTitle: true,
    actions: [
      CircleAvatar(
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
    ],
  );
}
