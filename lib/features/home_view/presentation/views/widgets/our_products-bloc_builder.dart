import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_entity.dart';
import '../../manager/get_products_cubit.dart';
import 'our_product_item.dart';

BlocBuilder<GetProductsCubit, GetProductsState> ourProductsBlocBuilder(context) {
  BlocProvider.of<GetProductsCubit>(context).getOurProducts();
  return BlocBuilder<GetProductsCubit, GetProductsState>(
    builder: (context, state) {
      if(state is GetProductsSuccess) {
        List<ProductEntity> products = state.products;
        return SliverToBoxAdapter(
          child: SizedBox(
            height: 150,
            child: ListView.builder(itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: OurProductItem(productEntity:products[index] ,),
              );
            },
              scrollDirection: Axis.horizontal,
              itemCount: products.length,),
          ),
        );
      }else if(state is GetProductsFailure){
        return SliverToBoxAdapter(child: Text(state.errorMessage.toString()));
      }else{
        return SliverToBoxAdapter(child: Text('loading'));
      }
    },
  );
}

