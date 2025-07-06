import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/cutom_text-field.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';

import '../../../../../generated/l10n.dart';
import '../../manager/set_orderes_cubit/set_orders_cubit.dart';
import '../../../../../core/utilis/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

void editFieldBottomSheet(BuildContext context) {
  String? address;
  TextEditingController addressController = TextEditingController(
    text: BlocProvider.of<SetOrdersCubit>(context).orderEntity.address ?? '',
  );

  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // للسماح بتوسيع الـ Bottom Sheet
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Row contains close button and title
            Row(
              children: [
                Text(S.of(context).editaddress, style: Styles.bold19),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            SizedBox(height: 20),
            CustomTextField(
              labelText: S.of(context).enternewaddress,
              controller: addressController,
              onChanged: (value) {
                address = value;
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              title: S.of(context).save,
              titleStyle: Styles.bold19.copyWith(color: Colors.white),
              backgroundColor: Styles.primaryColor,
              borderRadius: 16,
              height: 55,
              width: double.infinity,
              onPressed: () {
                var orderEntity = BlocProvider.of<SetOrdersCubit>(context).orderEntity;

                BlocProvider.of<SetOrdersCubit>(context).orderEntity = OrderEntity(
                  address: address,
                  price: orderEntity.price,
                  payCash: orderEntity.payCash,
                  phone: orderEntity.phone,
                  email: orderEntity.email,
                  name: orderEntity.name,
                  userID: orderEntity.userID,
                  city: orderEntity.city,
                  delivery: orderEntity.delivery,
                  flatNumber: orderEntity.flatNumber,
                );

                BlocProvider.of<SetOrdersCubit>(context).setOrderAddress(address: address!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
