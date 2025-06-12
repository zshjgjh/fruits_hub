import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/widgets/order_stack.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/shipping_view.dart';


import '../../../../../core/utilis/styles.dart';
import '../../../cart_view/data/entities/cart_entity.dart';

class ShipViewBody extends StatelessWidget {
  const ShipViewBody({
    super.key, required this.cartEntity,
  });
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:OrderStack()
    );
  }
}

