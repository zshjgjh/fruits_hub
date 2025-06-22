import 'package:flutter/material.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';




class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.orderEntity});
final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    var date=DateFormat('dd/MM/yyyy hh:mm a').format(orderEntity.date!);
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10,
        children: [
          Image.asset(Assets.imagesOrder),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text('Order number:', style: Styles.semiBold16),
              Text('${orderEntity.id}', style: Styles.regular11),
              Row(
                children: [
                  Text('ordered at : ', style: Styles.regular13.copyWith(color: Color(0xff949D9E)),),
                  Text(date, style: Styles.regular13.copyWith(color: Color(0xff949D9E)),),
                ],
              ),
              Row(
                spacing: 20,
                children: [
                  Text('Items amount:', style: Styles.regular13.copyWith(
                      color: Color(0xff949D9E)),),
                  Text('${orderEntity.amount}', style: Styles.semiBold13,),
                  Text('${orderEntity.price}'r'$', style: Styles.semiBold16),
                ],
              ),


            ],
          )
        ],
      ),
    );
  }
}