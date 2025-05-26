import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({
    super.key, required this.title, required this.subTitle, required this.image,
  });
 final String title;
 final String subTitle;
 final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Color(0xffF1F1F5)
        )
      ),
      child: ListTile(
        leading: Image.asset(image),
        title: Text(title,style: Styles.bold16.copyWith(color: Color(0xff23AA49))),
        subtitle: Text(subTitle,style: Styles.semiBold13.copyWith(color: Color(0xff979899))),
      ),
    );
  }
}