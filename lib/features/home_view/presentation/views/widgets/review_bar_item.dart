import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';

class ReviewBarItem extends StatelessWidget {
  const ReviewBarItem({
    super.key, required this.title, required this.value,
  });
 final String title;
 final double? value;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Text(title,style: Styles.bold19,),
        Expanded(
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
          ),
        ),
      ],
    );
  }
}