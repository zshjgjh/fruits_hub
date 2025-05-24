import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/services/supabase/subabase_data_base_service.dart';
import 'package:fruits_hub/features/home_view/data/repo_impl/product_repo-impl.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/products_cubit/products_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/views/products_view.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/home_view_body.dart';
import 'package:fruits_hub/features/login_view/data/repos_impl/auth_repo_impl.dart';
import 'package:fruits_hub/features/login_view/domain/repos/auth_repo.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../../core/utilis/save_user_locally.dart';
import '../../../../core/widgets/build_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabControllerProvider>(context);

    return Scaffold(
      body:HomeViewBody(),
      bottomNavigationBar: buildBottomBar(tabProvider: tabProvider ),
    );
  }
}


