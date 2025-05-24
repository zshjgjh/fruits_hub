import 'package:flutter/material.dart';

import '../utilis/styles.dart';
import 'build_app_bar.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.labelText,
    this.style,
    this.maxLines=1,
    this.textInputType,
    this.onSaved,
    this.hiddenText=false,
    this.borderRadius,
    this.controller,
    this.onChanged
  });

final String? labelText;
final TextStyle? style;
final int? maxLines;
final double? borderRadius;
final TextInputType? textInputType;
final void Function(String?)? onSaved;
final bool? hiddenText;
 final TextEditingController? controller;
 final void Function(String)? onChanged;


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  bool obSecureText=true;
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
      obscureText:widget.hiddenText!?obSecureText:false,
      onSaved: widget.onSaved,
      onChanged:widget.onChanged ,
      decoration: InputDecoration(
        labelText:widget.labelText,
        labelStyle: widget.style,
        fillColor: Colors.grey.withOpacity(.02),
        filled: true,
        suffixIcon: widget.hiddenText!?
        IconButton(onPressed:(){
          if(obSecureText==true){
            obSecureText=false;
            setState(() {
            });
          }else{
            obSecureText=true;
            setState(() {
            });
          }
        },
            icon:Icon( Icons.remove_red_eye)):null,

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