import 'package:flutter/material.dart';





class CustomSigninButton extends StatelessWidget {
  const CustomSigninButton({super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    required this.borderRadius,
    required this.titleStyle,
    required this.leading,
    this.borderColor
  });
  final void Function() onPressed;
  final String title;
  final String leading;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final TextStyle titleStyle;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          side: BorderSide(color:borderColor! ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                borderRadius
            ),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child:
           Row(
             children: [
               Spacer(),
               Text(title,style: titleStyle,),
               Spacer(),
               Image.asset(leading),


             ],
           ),

        )
    );
  }
}
