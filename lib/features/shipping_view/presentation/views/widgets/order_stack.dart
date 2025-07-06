import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/cart_view/presentation/manager/cart_cubit.dart';
import 'package:fruits_hub/features/shipping_view/presentation/manager/set_orderes_cubit/set_orders_cubit.dart';

import '../../../../../core/widgets/build_app_bar.dart';
import '../../../../../generated/l10n.dart';
import '../review_view.dart';
import '../address_view.dart';
import '../payment_view.dart';
import '../shipping_view.dart';
import 'checkout_time_line.dart';

class OrderStack extends StatefulWidget {
  const OrderStack({super.key});

  @override
  State<OrderStack> createState() => _OrderStackState();
}

class _OrderStackState extends State<OrderStack> {
  int currentStep = 0;
  int maxStepReached = 0;

  bool get payCash =>
      BlocProvider.of<SetOrdersCubit>(context).orderEntity.payCash ?? true;

  @override
  Widget build(BuildContext context) {

    final List<String> steps = payCash
        ? [S.of(context).shipping, S.of(context).address, S.of(context).review]
        : [S.of(context).shipping, S.of(context).address, S.of(context).payment, S.of(context).review];

    return Scaffold(
      body: Column(
        children: [
          buildAppBar(context,
              title: steps[currentStep],
              onPressed: () {
                if (currentStep > 0) {
                  setState(() {
                    currentStep -= 1;
                  });
                } else {
                  Navigator.of(context).pop();
                }
              },
              isArrowExists: true),
          CheckoutTimeline(
            currentStep: currentStep,
            onStepTapped: (index) {
              // Allow tapping only on completed or current steps
              if (index <= maxStepReached) {
                setState(() {
                  currentStep = index;
                });
              }
            },
            steps: steps, // Pass steps list to timeline
            maxStepReached: maxStepReached,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: IndexedStack(
              index: currentStep,
              children: payCash
                  ? [
                ShippingView(
                  onNext: () {
                    setState(() {
                      currentStep = 1;
                      if (maxStepReached < 1) maxStepReached = 1;
                    });
                  },
                ),
                AddressView(
                  onNext: () {
                    setState(() {
                      currentStep = 2; // Jump directly to Review
                      if (maxStepReached < 2) maxStepReached = 2;
                    });
                  },
                ),
                ReviewView(),
              ]
                  : [
                ShippingView(
                  onNext: () {
                    setState(() {
                      currentStep = 1;
                      if (maxStepReached < 1) maxStepReached = 1;
                    });
                  },
                ),
                AddressView(
                  onNext: () {
                    setState(() {
                      currentStep = 2; // Payment step
                      if (maxStepReached < 2) maxStepReached = 2;
                    });
                  },
                ),
                PaymentView(
                  onNext: () {
                    setState(() {
                      currentStep = 3; // Review step
                      if (maxStepReached < 3) maxStepReached = 3;
                    });
                  },
                ),
                ReviewView(
                  onEditPayment: () {
                    setState(() {
                      currentStep = 2; // الخطوة الخاصة بصفحة الدفع
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
