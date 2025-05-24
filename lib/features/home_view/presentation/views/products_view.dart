import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/build_bottom_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/home_view/presentation/views/best_seller_view.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/build_bottom_sheet.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/our_product_item.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/our_products-bloc_builder.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/product_item.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/products_bloc_builder.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/search_field.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../domain/entities/product_entity.dart';
import '../manager/products_cubit/products_cubit.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({
    super.key,
  });

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildAppBar(context, title: 'Products',
                      leading: Image.asset(Assets.imagesNotification)),
                  SearchField(),
                  Row(
                    children: [
                      Text('Our Products', style: Styles.bold19,),
                      Spacer(),
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
                      )
                    ],
                  ),
                  SizedBox(height: 1,)
                ],
              ),
            ),
            ourProductsBlocBuilder(context),

            SliverToBoxAdapter(
                child: SizedBox(height: 20,)),

            SliverToBoxAdapter(
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: BestSellerView(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation: PageTransitionAnimation
                              .cupertino,
                        );
                      },
                      child: Text('Best Seller', style: Styles.bold16,)),
                  Spacer(),
                  GestureDetector(
                      child: Text('Show more', style: Styles.regular13.copyWith(
                          color: Color(0xFF949D9E)),))
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(height: 20,)),

            productsBlocBuilder()
          ]),
    );
  }


}
