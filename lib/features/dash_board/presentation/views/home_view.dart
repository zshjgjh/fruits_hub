import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/dash_board/presentation/views/widgets/home_view_body.dart';


import '../../../../core/utilis/services/supabase/subabase_data_base_service.dart';
import '../../../../core/utilis/services/supabase/supabase_storage_service.dart';

import '../../data/repos_impl/supabase/image_repo_impl_supabase.dart';
import '../../data/repos_impl/supabase/product_repo-impl_supabase.dart';
import '../manager/add_product_cubit.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AddProductCubit>(
        create: (context) {
         return AddProductCubit(
              ProductRepoImplSupabase(supabaseDataBase: SupaBaseDataBase()),
              ImageRepoImplSupabase(supaBaseStorageService: SupaBaseStorageService()));
        },
        child: HomeViewBody(),
      ),
    );
  }
}