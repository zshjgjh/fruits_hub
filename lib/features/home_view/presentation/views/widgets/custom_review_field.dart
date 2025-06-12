import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';


class CustomReviewField extends StatefulWidget {
  const CustomReviewField({
    super.key,
    this.labelText,
    this.style,
    this.maxLines=1,
    this.textInputType,
    this.onSubmited,
    this.borderRadius=4,
    this.controller,
    this.onChanged,
    this.onSaved
  });

  final String? labelText;
  final TextStyle? style;
  final int? maxLines;
  final double? borderRadius;
  final TextInputType? textInputType;
  final void Function(String)? onSubmited;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
final void Function(String?)? onSaved;

  @override
  State<CustomReviewField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomReviewField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value!.isEmpty){
          return 'field is required';
        }
      },
      controller:widget.controller,
      maxLines:widget.maxLines ,
      keyboardType: widget.textInputType,
      onSaved:widget.onSaved ,
      onFieldSubmitted: widget.onSubmited,
      onChanged:widget.onChanged ,
      decoration: InputDecoration(
        labelText:widget.labelText,
        labelStyle: widget.style,
        fillColor: Colors.white,
        filled: true,
        suffixIcon: Image.asset(Assets.imagesReviewIcon),


        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius??4),
          borderSide: BorderSide(
            width: 0.1,
            color: Colors.grey.shade500,

          ),
        ) ,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width:0.1,


          ),
        ) ,


      ),
    );
  }
}