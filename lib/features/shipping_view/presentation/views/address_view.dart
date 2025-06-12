import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:fruits_hub/features/shipping_view/domain/order_entity.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/widgets/custom_radio_list.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/payment_view.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import 'review_view.dart';
import 'widgets/checkout_time_line.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key, required this.orderEntity, required this.onNext});

  final OrderEntity orderEntity;
  final VoidCallback onNext;
  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> with AutomaticKeepAliveClientMixin {
  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? flatNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 20,
                children: [


                  CustomTextField(
                    labelText: 'Full name',
                    style: Styles.bold13.copyWith(color: Color(0xff949D9E)),
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    onSaved: (value) {
                      name = value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Email',
                    style: Styles.bold13.copyWith(color: Color(0xff949D9E)),
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    onSaved: (value) {
                      email = value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Address',
                    style: Styles.bold13.copyWith(color: Color(0xff949D9E)),
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    onSaved: (value) {
                      address = value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'City',
                    style: Styles.bold13.copyWith(color: Color(0xff949D9E)),
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    onSaved: (value) {
                      city = value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'flat number',
                    style: Styles.bold13.copyWith(color: Color(0xff949D9E)),
                    textInputType: TextInputType.text,
                    maxLines: 2,
                    onSaved: (value) {
                      flatNumber = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    height: 55,
                    title: 'Next',
                    backgroundColor: Styles.primaryColor,
                    borderRadius: 16,
                    titleStyle: Styles.bold19.copyWith(color: Colors.white),
                    onPressed: () {
                      // if (key.currentState!.validate()) {
                      //   key.currentState!.save();
                      OrderEntity orderEntity = OrderEntity(
                        userID: widget.orderEntity.id,
                        payCash: widget.orderEntity.payCash,
                        price: widget.orderEntity.price,
                        name: name,
                        email: email,
                        phone: phone,
                        address: address,
                        city: city,
                        flatNumber: flatNumber,
                      );


                      widget.onNext();

                      // } else {
                      //   autovalidateMode = AutovalidateMode.always;
                      //  }
                    },
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
