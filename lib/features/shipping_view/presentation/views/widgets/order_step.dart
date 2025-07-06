import 'package:flutter/material.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class OrderStep extends StatelessWidget {
  const OrderStep({
    super.key, required this.title, required this.image, required this.isCompleted, required this.subTitle,
  });
  final String title;
  final String subTitle;
  final String image;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      selectedColor: Styles.primaryColor,
      leading: Image.asset(image),
      title: Text(title,style: Styles.bold13,),
      subtitle:isCompleted? Text(subTitle,style: Styles.semiBold13.copyWith(color: Color(0xff949D9E)),):
      Text(S.of(context).wait,style: Styles.semiBold13.copyWith(color: Color(0xff949D9E)),),
    );
  }
}