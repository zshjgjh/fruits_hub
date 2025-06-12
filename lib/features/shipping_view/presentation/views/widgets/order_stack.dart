import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/cart_view/presentation/manager/cart_cubit.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/payment_view.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/shipping_view.dart';

import '../../../../../core/widgets/build_app_bar.dart';
import '../../../../cart_view/data/entities/cart_entity.dart';
import '../../../domain/order_entity.dart';
import '../review_view.dart';
import '../address_view.dart';
import 'checkout_time_line.dart';

class OrderStack extends StatefulWidget {
  const OrderStack({super.key});

  @override
  State<OrderStack> createState() => _OrderStackState();
}

class _OrderStackState extends State<OrderStack> {
  int currentStep = 0;

  final OrderEntity order = OrderEntity();


  @override
  Widget build(BuildContext context) {
    final CartEntity cart = BlocProvider.of<CartCubit>(context).cartEntity;
    return Scaffold(
      body: Column(
        spacing: 10,
        children: [

          buildAppBar(context, title:
              currentStep==0? 'Shipping'
              :currentStep==1?'Address'
              :currentStep==2?'Payment'
              :'',
              onPressed: () {
            if(currentStep >0) {
              currentStep -= 1;
              setState(() {

              });
            }
            else{
              Navigator.of(context).pop();
            }
          }, isArrowExists: true),

          CheckoutTimeline(
            currentStep: currentStep,
            onStepTapped: (index) {
              setState(() {
                currentStep = index;
              });
            },
          ),
          Expanded(
            child: IndexedStack(
              index: currentStep,
              children: [
                ShippingView(
                  cartEntity: cart,
                  onNext: () => setState(() => currentStep = 1),
                ),
                AddressView(
                  orderEntity: order,
                  onNext: () => setState(() => currentStep = 2),
                ),

                ReviewView(orderEntity: order, onNext: ()=> setState(() => currentStep = 3)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}