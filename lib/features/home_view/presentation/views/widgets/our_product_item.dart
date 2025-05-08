import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class OurProductItem extends StatelessWidget {
  const OurProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey.shade200,
          child: Image.asset(Assets.imagesStrawberry,fit: BoxFit.fill,),
        ),
        Text('Strawberry')
      ],
    );
  }
}


