import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/cart_view/presentation/manager/cart_cubit.dart';
import 'package:fruits_hub/features/cart_view/presentation/views/widgets/cart_view_body.dart';

import '../../data/entities/cart_entity.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartEntity? cartEntity;
  @override
  void initState(){
    super.initState();
     cartEntity=BlocProvider.of<CartCubit>(context).cartEntity;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if(state is CartItemAdded){
            }else if(state is CartCleared){
              setState(() {

              });
            }
            else{

            }
          },
          builder: (BuildContext context,  state) {
            return CartViewBody(cartEntity: cartEntity!,);
          }
        )
    );
  }
}