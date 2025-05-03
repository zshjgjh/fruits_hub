import 'package:flutter/material.dart';
import 'package:fruits_hub/features/login_view/data/repos_impl/auth_repo_impl.dart';
import 'package:fruits_hub/features/login_view/domain/repos/auth_repo.dart';

import '../../../../core/utilis/save_user_locally.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text(getUserDataLocally().name))
        ]
      )
      );
  }
}
