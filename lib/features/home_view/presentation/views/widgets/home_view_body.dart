import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/utilis/save_user_locally.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/get_products_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/best_seller.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/home_view_appBar.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/product_item.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/products_bloc_builder.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/search_field.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import 'ad_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
      BlocProvider.of<GetProductsCubit>(context).getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
        SliverToBoxAdapter(
          child: Column(spacing: 20, children: [
            HomeViewAppBar(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchField(),
            ),
            AdItem(),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: BestSellerView(),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                        PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Text(
                      'Best Seller',
                      style: Styles.bold16,
                    )),
                Spacer(),
                GestureDetector(
                    child: Text(
                      'Show more',
                      style: Styles.regular13.copyWith(
                          color: Color(0xFF949D9E)),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            )
          ]),
        ),
        productsBlocBuilder()
      ]),
    );
  }
}


