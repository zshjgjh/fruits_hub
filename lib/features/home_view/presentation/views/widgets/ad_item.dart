import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

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
                Text( S.of(context).specialoffers,style: Styles.regular13.copyWith(color: Colors.white),),
                Text( S.of(context).discount,style: Styles.bold19.copyWith(color: Colors.white),),
                CustomButton(
                    onPressed:(){},
                    width: 116,
                    height: 32,
                    title: S.of(context).shopnow,
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
