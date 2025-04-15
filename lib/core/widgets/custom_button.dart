import 'package:flutter/material.dart';

import '../utilis/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    required this.onPressed,
    required this.title,
    required this.backgroundColor,
    required this.borderRadius,
    required this.titleStyle
  });
  final void Function() onPressed;
  final String title;
  final Color backgroundColor;
  final double borderRadius;
  final TextStyle titleStyle;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
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
