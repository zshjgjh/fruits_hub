import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/save_user_locally.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/shipping_view/domain/order_entity.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/widgets/custom_radio_list.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../core/utilis/styles.dart';
import '../../../cart_view/data/entities/cart_entity.dart';

class ShippingView extends StatefulWidget {
  final CartEntity cartEntity;
  final VoidCallback onNext;

  const ShippingView({
    super.key,
    required this.cartEntity,
    required this.onNext,
  });

  @override
  State<ShippingView> createState() => _ShippingViewState();
}

class _ShippingViewState extends State<ShippingView> with AutomaticKeepAliveClientMixin {
  String? selectedShippingOption;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 20,
          children: [

        CustomRadioList(
            title: 'Payment on delivery',
            subTitle: 'Delivery on place',
            secondary: '${widget.cartEntity.calculateTotalPrice() + 40}',
            value: 'option 1',
            selectedValue: selectedShippingOption ?? '',
            isSelected: selectedShippingOption == 'option 1',
            onChanged: (value) {
              selectedShippingOption = value;
              setState(() {});
            }),
        CustomRadioList(
            title: 'Payment online',
            subTitle: 'please choose payment method',
            secondary: '${widget.cartEntity.calculateTotalPrice()}',
            value: 'option 2',
            selectedValue: selectedShippingOption ?? '',
            isSelected: selectedShippingOption == 'option 2',
            onChanged: (value) {
              selectedShippingOption = value;
              setState(() {});
            }),
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
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}