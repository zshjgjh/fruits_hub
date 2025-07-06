import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';



class CustomEditField extends StatefulWidget {
  const CustomEditField({
    super.key,
    this.labelText,
    this.style,
    this.maxLines=1,
    this.textInputType,
    this.onSaved,
    this.borderRadius=4,
    this.controller,
    this.onChanged,
    this.onPressed,
    this.onTapOutside,


  });

  final String? labelText;
  final TextStyle? style;
  final int? maxLines;
  final double? borderRadius;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final  Function(PointerDownEvent)? onTapOutside;


  @override
  State<CustomEditField> createState() => _CustomEditFieldState();
}

class _CustomEditFieldState extends State<CustomEditField> {
  @override

  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value!.isEmpty){
          return S.of(context).fieldrequired;
        }
      },
      controller:widget.controller,
      maxLines:widget.maxLines ,
      keyboardType: widget.textInputType,
      onSaved: widget.onSaved,
      onChanged:widget.onChanged ,
      onTapOutside:widget.onTapOutside,
      decoration: InputDecoration(

        labelText:widget.labelText,
        labelStyle: widget.style,
        fillColor: Colors.grey.withOpacity(.02),
        filled: true,

        suffixIcon: IconButton(
            onPressed:widget.onPressed,
            icon:Icon( Icons.edit)),

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