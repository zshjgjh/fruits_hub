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
    this.hiddenText=false
  });

final String? labelText;
final TextStyle? style;
final int? maxLines;
final TextInputType? textInputType;
final void Function(String?)? onSaved;
final bool? hiddenText;


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
      maxLines:widget.maxLines ,
      keyboardType: widget.textInputType,
      obscureText:widget.hiddenText!?obSecureText:false,
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        labelText:widget.labelText,
        labelStyle: widget.style,

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

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: Color(0xFFE6E9EA),
              style: BorderStyle.solid,
          ),
        ) ,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: Styles.primaryColor,
              style: BorderStyle.solid
          ),
        ) ,


      ),
    );
  }
}