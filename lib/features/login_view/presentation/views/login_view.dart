import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/login_view/data/repos_impl/auth_repo_impl.dart';
import 'package:fruits_hub/features/login_view/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/login_view/presentation/manager/auth_cubit.dart';
import 'package:fruits_hub/features/login_view/presentation/widgets/loginn_view_body.dart';

import '../../../../core/utilis/services/fire_base/fire_base_auth_service.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}