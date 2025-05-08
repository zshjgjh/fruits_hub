import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/product_item.dart';

import '../../../domain/entities/product_entity.dart';
import '../../manager/get_products_cubit.dart';

BlocBuilder<GetProductsCubit, GetProductsState> productsBlocBuilder() {
  return BlocBuilder<GetProductsCubit, GetProductsState>(
    builder: (context, state) {
      if(state is GetProductsSuccess) {
        List<ProductEntity> products = state.products;
        print(products);
        return SliverGrid(
            delegate: SliverChildBuilderDelegate((BuildContext, index) {
              return ProductItem(productEntity: products[index],);
            }, childCount: products.length
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.2 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20));
      }else if(state is GetProductsFailure){
        print(state.errorMessage.toString());
        return SliverToBoxAdapter(child: Text(state.errorMessage.toString()));
      }else{
        return SliverToBoxAdapter(child: Text('loading'));
      }
    },
  );
}
