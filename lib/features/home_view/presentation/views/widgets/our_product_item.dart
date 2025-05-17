import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class OurProductItem extends StatelessWidget {
  const OurProductItem({
    super.key, required this.productEntity,
  });
final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 80,
          child: Image.network(productEntity.imageUrl!,fit: BoxFit.fill,),
        ),
        Text(productEntity.name)
      ],
    );
  }
}


