import 'package:flutter/material.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class OrderStep extends StatelessWidget {
  const OrderStep({
    super.key, required this.title, required this.image, required this.orderEntity, required this.isCompleted,
  });
  final String title;
  final String image;
  final OrderEntity orderEntity;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    var date=DateFormat('dd/MM/yyyy hh:mm a').format(orderEntity.date!);
    return ListTile(
      selectedColor: Styles.primaryColor,
      leading: Image.asset(image),
      title: Text(title,style: Styles.bold13,),
      subtitle:isCompleted? Text(date,style: Styles.semiBold13.copyWith(color: Color(0xff949D9E)),):SizedBox(),
    );
  }
}