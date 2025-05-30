import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';

class ReviewBarItem extends StatelessWidget {
  const ReviewBarItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Text('5',style: Styles.bold19,),
        Expanded(
          child: LinearProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
          ),
        ),
      ],
    );
  }
}