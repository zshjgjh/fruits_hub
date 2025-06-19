import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/widgets/order_stack.dart';

class ShipViewBody extends StatelessWidget {
  const ShipViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:OrderStack()
    );
  }
}

