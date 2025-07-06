import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/styles.dart';
import 'package:fruits_hub/features/home_view/presentation/manager/products_cubit/products_cubit.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/ad_item.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/home_view_appBar.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/products_bloc_builder.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/search_field.dart';
import 'package:fruits_hub/features/home_view/presentation/views/best_seller_view.dart';
import 'package:fruits_hub/features/home_view/presentation/views/search_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../generated/l10n.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with AutomaticKeepAliveClientMixin<HomeViewBody> {

  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<ProductsCubit>(context);
    if (cubit.state is! ProductsSuccess) {
      cubit.getProducts(); // تحميل المنتجات فقط إذا لم تكن محمّلة مسبقاً
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // مهم جداً عند استخدام AutomaticKeepAliveClientMixin
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: Column(
              children: [
                const HomeViewAppBar(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchField(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const SearchView(),
                        withNavBar: true,
                      );
                    },
                  ),
                ),
                const AdItem(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const BestSellerView(),
                          withNavBar: true,
                          pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Text(S.of(context).bestseller, style: Styles.bold16),
                    ),
                    const Spacer(),
                    Text(
                      S.of(context).showmore,
                      style: Styles.regular13.copyWith(color: const Color(0xFF949D9E)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        productsBlocBuilder(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
