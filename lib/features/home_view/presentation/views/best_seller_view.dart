import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/app_routers.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/products_bloc_builder.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../manager/products_cubit/products_cubit.dart';

class BestSellerView extends StatefulWidget {
  const BestSellerView({
    super.key,
  });

  @override
  State<BestSellerView> createState() => _BestSellerViewState();
}

class _BestSellerViewState extends State<BestSellerView> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<ProductsCubit>(context);
    if (cubit.state is! ProductsSuccess) {
      cubit.getBestSellingProducts(context);
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // مهم جداً عند استخدام AutomaticKeepAliveClientMixin

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildAppBar(
                    context,
                    title: S.of(context).bestseller,
                    action: Image.asset(Assets.imagesNotification),
                    onPressed: () {
                      PersistentNavBarNavigator.pop(context);
                    },
                    isArrowExists: true,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    S.of(context).bestseller,
                    style: Styles.bold19,
                  ),
                  const SizedBox(height: 1),
                ],
              ),
            ),
            productsBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
