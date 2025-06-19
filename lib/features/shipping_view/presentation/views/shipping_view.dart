import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/cart_view/presentation/manager/cart_cubit.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/widgets/custom_radio_list.dart';

import '../../../../core/utilis/styles.dart';
import '../manager/set_orderes_cubit/set_orders_cubit.dart';

class ShippingView extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback? onPaymentMethodChanged;

  const ShippingView({
    super.key,
    required this.onNext,
    this.onPaymentMethodChanged,
  });

  @override
  State<ShippingView> createState() => _ShippingViewState();
}

class _ShippingViewState extends State<ShippingView> with AutomaticKeepAliveClientMixin {
  String? selectedShippingOption;

  @override
  void initState() {
    super.initState();
    final payCash = BlocProvider.of<SetOrdersCubit>(context).orderEntity.payCash;
    selectedShippingOption = (payCash ?? true) ? 'option 1' : 'option 2';
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          children: [
            CustomRadioList(
              title: 'Payment on delivery',
              subTitle: 'Delivery on place',
              secondary: '${BlocProvider.of<CartCubit>(context).cartEntity.calculateTotalPrice() + 40}',
              value: 'option 1',
              selectedValue: selectedShippingOption ?? '',
              isSelected: selectedShippingOption == 'option 1',
              onChanged: (value) {
                if (value != selectedShippingOption) {
                  setState(() {
                    selectedShippingOption = value;
                  });
                  BlocProvider.of<SetOrdersCubit>(context).orderEntity =
                      OrderEntity(payCash: true);
                  if (widget.onPaymentMethodChanged != null) widget.onPaymentMethodChanged!();
                }
              },
            ),
            CustomRadioList(
              title: 'Payment online',
              subTitle: 'please choose payment method',
              secondary: '${BlocProvider.of<CartCubit>(context).cartEntity.calculateTotalPrice()}',
              value: 'option 2',
              selectedValue: selectedShippingOption ?? '',
              isSelected: selectedShippingOption == 'option 2',
              onChanged: (value) {
                if (value != selectedShippingOption) {
                  setState(() {
                    selectedShippingOption = value;
                  });
                  BlocProvider.of<SetOrdersCubit>(context).orderEntity =
                      OrderEntity(payCash: false);
                  if (widget.onPaymentMethodChanged != null) widget.onPaymentMethodChanged!();
                }
              },
            ),
            const Spacer(),
            CustomButton(
              height: 55,
              title: 'Next',
              backgroundColor: Styles.primaryColor,
              borderRadius: 16,
              titleStyle: Styles.bold19.copyWith(color: Colors.white),
              onPressed: () {
                if (selectedShippingOption == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Please select a shipping option',
                        style: Styles.bold19.copyWith(color: Colors.white),
                      ),
                      backgroundColor: Styles.secondaryColor,
                    ),
                  );
                } else {
                  widget.onNext();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
