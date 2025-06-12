import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/cart_view/data/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home_view/presentation/views/product_detail_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../domain/entities/product_entity.dart';
import '../../manager/products_cubit/products_cubit.dart';
import '../best_seller_view.dart';
import 'our_product_item.dart';

BlocBuilder<ProductsCubit, ProductsState> ourProductsBlocBuilder(context) {
  BlocProvider.of<ProductsCubit>(context).getOurProducts();
  return BlocBuilder<ProductsCubit, ProductsState>(
    builder: (context, state) {
      if(state is ProductsSuccess) {
        List<ProductEntity> products = state.products;
        return SliverToBoxAdapter(
          child: SizedBox(
            height: 150,
            child: ListView.builder(itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: ProductDetailsView(productEntity: products[index], cartItemEntity: CartItemEntity(productEntity: products[index])),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    );
                  },
                    child: OurProductItem(productEntity:products[index] ,)),
              );
            },
              scrollDirection: Axis.horizontal,
              itemCount: products.length,),
          ),
        );
      }else if(state is ProductsFailure){
        return SliverToBoxAdapter(child: Text(state.errorMessage.toString()));
      }else{
        return SliverToBoxAdapter(child: Text('loading'));
      }
    },
  );
}

