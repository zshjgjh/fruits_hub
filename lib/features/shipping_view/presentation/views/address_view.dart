import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/save_user_locally.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:fruits_hub/features/cart_view/data/entities/cart_entity.dart';
import 'package:fruits_hub/features/home_view/presentation/views/product_detail_view.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../cart_view/presentation/manager/cart_cubit.dart';
import '../manager/set_orderes_cubit/set_orders_cubit.dart';



class AddressView extends StatefulWidget {
  const AddressView({
    super.key,
    required this.onNext,
  });

  final VoidCallback onNext;
  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView>
    with AutomaticKeepAliveClientMixin {


  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? flatNumber;

  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SetOrdersCubit, SetOrdersState>(
  listener: (context, state) {
   if(state is SetOrderAddressSuccess){
      addressController = TextEditingController( text:  BlocProvider
         .of<SetOrdersCubit>(context)
         .orderEntity.address??'');
     setState(() {

     });
   }
  },
  builder: (context, state) {
    return Form(
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
                    labelText: 'Phone',
                    style: Styles.bold13.copyWith(color: Color(0xff949D9E)),
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    onSaved: (value) {
                      phone = value;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Address',
                    controller:addressController,
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
                      if (key.currentState!.validate()) {
                        key.currentState!.save();
                        BlocProvider.of<SetOrdersCubit>(context).orderEntity =
                            OrderEntity(
                          userID: getUserDataLocally().id,
                          payCash: BlocProvider.of<SetOrdersCubit>(context)
                              .orderEntity
                              .payCash,
                          price: BlocProvider.of<CartCubit>(context)
                              .cartEntity
                              .calculateTotalPrice(),
                          name: name,
                          email: email,
                          phone: phone,
                          address: address,
                          city: city,
                          flatNumber: flatNumber,
                        );

                       widget.onNext();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ]),
      );
  },
),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
