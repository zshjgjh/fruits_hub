import 'package:flutter/material.dart';

import '../../../../../core/utilis/save_user_locally.dart';
import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesAvatar, height: 50, width: 50,),
      title: Text(S.of(context).hi, style: Styles.bold19,),
      subtitle: Text(getUserDataLocally().name, style: Styles.bold19,),
      trailing: Image.asset(Assets.imagesNotification,),
    );
  }
}