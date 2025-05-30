import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/services/supabase/subabase_data_base_service.dart';
import 'package:fruits_hub/features/home_view/data/repo_impl/product_repo-impl.dart';
import 'package:fruits_hub/features/home_view/data/repo_impl/review_repo_impl.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/products_cubit/products_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/search_cubit/search_cubit.dart';


import '../../../../core/utilis/save_user_locally.dart';
import '../../../../core/widgets/build_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabControllerProvider>(context);

    return MultiBlocProvider(providers: [
      BlocProvider<SearchCubit>(
        create: (BuildContext context)
    {
      return SearchCubit();
    },),
      BlocProvider<ReviewsCubit>(create: (BuildContext context) {
        return ReviewsCubit(reviewsRepo: ReviewsRepoImpl(supaBaseDataBaseService: SupaBaseDataBaseService()));
      },)
    ],
      child: Scaffold(
        body: HomeView(),
        bottomNavigationBar: buildBottomBar(tabProvider: tabProvider),
      ),
    );
  }
}


