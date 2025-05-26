import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/product_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../domain/entities/product_entity.dart';
import '../../manager/products_cubit/products_cubit.dart';
import '../product_detail_view.dart';

BlocBuilder<ProductsCubit, ProductsState> productsBlocBuilder() {
  return BlocBuilder<ProductsCubit, ProductsState>(
    builder: (context, state) {
      if(state is ProductsSuccess) {
        List<ProductEntity> products = state.products;
        return SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return GestureDetector(
                onTap: (){
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: ProductDetailsView(),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation:
                    PageTransitionAnimation.cupertino,
                  );
                },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0,left: 8),
                    child: ProductItem(productEntity: products[index],),
                  ));
            },
                childCount: products.length
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.2 / 4,
                crossAxisSpacing: 0,
                mainAxisSpacing: 20));
      }else if(state is ProductsFailure){
        return SliverToBoxAdapter(child: Text('Fail to fetch products...please try later'));
      }else {
        return SliverToBoxAdapter(child: Text('loading'));
      }
    },
  );
}
