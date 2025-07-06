import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/build_bottom_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/home_view/presentation/views/best_seller_view.dart';
import 'package:fruits_hub/features/home_view/presentation/views/search_view.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/build_bottom_sheet.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/our_product_item.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/our_products-bloc_builder.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/product_item.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/products_bloc_builder.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/search_field.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/product_entity.dart';
import '../manager/products_cubit/products_cubit.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({
    super.key,
  });

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<ProductsCubit>(context);
    if (cubit.state is! ProductsSuccess) {
      cubit.getProducts();
    }
  }

  @override
  bool get wantKeepAlive =>
      true; // للحفاظ على حالة الويجت وعدم إعادة البناء عند التنقل

  @override
  Widget build(BuildContext context) {
    super.build(context); // مهم جداً عند استخدام AutomaticKeepAliveClientMixin

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppBar(
                  context,
                  title: S.of(context).products,
                  action: Image.asset(Assets.imagesNotification),
                  isArrowExists: false,
                ),
                const SizedBox(height: 20),
                SearchField(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const SearchView(),
                      withNavBar: true,
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(S.of(context).ourproducts, style: Styles.bold19),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        buildBottomSheet(context);
                      },
                      style: TextButton.styleFrom(
                        iconSize: 30,
                        side: BorderSide(color: Colors.grey.withOpacity(.2)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Image.asset(Assets.imagesSwaparrow),
                    ),
                  ],
                ),
                const SizedBox(height: 1),
              ],
            ),
          ),
          ourProductsBlocBuilder(context),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Row(
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
                GestureDetector(
                  child: Text(
                    S.of(context).showmore,
                    style: Styles.regular13
                        .copyWith(color: const Color(0xFF949D9E)),
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          productsBlocBuilder()
        ],
      ),
    );
  }
}
