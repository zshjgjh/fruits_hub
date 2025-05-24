import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/product_item.dart';

import '../../../domain/entities/product_entity.dart';
import '../../manager/products_cubit/products_cubit.dart';

BlocBuilder<ProductsCubit, ProductsState> productsBlocBuilder() {
  return BlocBuilder<ProductsCubit, ProductsState>(
    builder: (context, state) {
      if(state is ProductsSuccess) {
        List<ProductEntity> products = state.products;
        return SliverGrid(
            delegate: SliverChildBuilderDelegate((BuildContext, index) {
              return ProductItem(productEntity: products[index],);
            },
                childCount: products.length
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.2 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20));
      }else if(state is ProductsFailure){
        return SliverToBoxAdapter(child: Text('Fail to fetch products...please try later'));
      }else {
        return SliverToBoxAdapter(child: Text('loading'));
      }
    },
  );
}
