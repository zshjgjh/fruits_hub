import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/services/fire_base/fire_store_service.dart';
import 'package:fruits_hub/core/utilis/services/supabase/subabase_data_base_service.dart';
import 'package:fruits_hub/features/login_view/data/repos_impl/auth_repo_impl.dart';
import 'package:fruits_hub/features/login_view/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/login_view/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/login_view/presentation/manager/singin_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/login_view/presentation/views/widgets/signin_view_body.dart';


import '../../../../core/utilis/services/fire_base/fire_auth_service.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SigninCubit>(
        create: (context) => SigninCubit(authRepo:AuthRepoImpl(fireBaseAuthService: FireAuthService(), fireStoreService: FireStoreService(), supaBaseDataBaseService: SupaBaseDataBaseService())),
        child: SigninViewBody(),
      ),
    );
  }
}