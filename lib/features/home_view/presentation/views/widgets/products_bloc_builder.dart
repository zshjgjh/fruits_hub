import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/cart_view/data/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/product_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/build_bottom_bar.dart';
import '../../../../cart_view/presentation/manager/cart_cubit.dart';
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
                    screen: ProductDetailsView(productEntity: products[index], cartItemEntity: CartItemEntity(productEntity:products[index],count: 0)),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation:
                    PageTransitionAnimation.cupertino,
                  );
                },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0,left: 8),
                    child: ProductItem(productEntity: products[index],
                    onPressed: (){
                      BlocProvider.of<CartCubit>(context).addItem(productEntity:products[index]);
                      Provider.of<TabControllerProvider>(context,listen: false).controller.index=2;


                    },),
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
