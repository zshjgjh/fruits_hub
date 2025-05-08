import 'package:flutter/material.dart';

import '../utilis/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    required this.onPressed,
    required this.title,
    required this.backgroundColor,
    required this.borderRadius,
    required this.titleStyle,
    required this.width,
    required this.height
  });
  final void Function() onPressed;
  final String title;
  final Color backgroundColor;
  final double borderRadius;
  final TextStyle titleStyle;
  final double width;
  final double height;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height:height,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius
            ),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: titleStyle
        ),
      ),
    );
  }
}
