import 'package:flutter/material.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';




class SuccessPaymentView extends StatelessWidget {
  const SuccessPaymentView({super.key, required this.orderEntity});
final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff2f3f380),
      child: Column(
        children: [
          Image.asset(Assets.imagesOrder),
          Row(
            children: [
              Text('Order number: ${orderEntity.id}', style: Styles.semiBold13),
              Text('ordered at: ',
                style: Styles.regular11.copyWith(color: Color(0xff949D9E)),),
              Row(
                children: [
                  Text('Orders number:', style: Styles.regular11.copyWith(
                      color: Color(0xff949D9E)),),
                  Text('10', style: Styles.semiBold13,),
                  Text('${orderEntity.price}', style: Styles.semiBold13),
                ],
              ),


            ],
          )
        ],
      ),
    );
  }
}