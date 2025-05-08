import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/assets.dart';

class AdItem extends StatelessWidget {
  const AdItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image:  DecorationImage(image: AssetImage(Assets.imagesFruits,) ),
      ),
      child:  Stack(
        alignment: Alignment.topRight,
        children: [
          Image.asset(Assets.imagesGreenad),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 20,
              children: [
                Text('Special offers',style: Styles.regular13.copyWith(color: Colors.white),),
                Text('25% off',style: Styles.bold19.copyWith(color: Colors.white),),
                CustomButton(
                    onPressed:(){},
                    width: 116,
                    height: 32,
                    title: 'Shop now',
                    backgroundColor: Colors.white,
                    borderRadius: 4,
                    titleStyle: Styles.bold13
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
