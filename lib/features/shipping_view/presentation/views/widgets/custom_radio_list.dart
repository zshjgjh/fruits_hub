import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';

class CustomRadioList extends StatefulWidget {
  const CustomRadioList({super.key,
    required this.title,
    required this.subTitle,
    required this.secondary,
    required this.value,
    this.onChanged,
    required this.selectedValue,
    required this.isSelected,
  });

 final String title;
  final String subTitle;
  final String secondary;
  final String value;
  final String selectedValue;
  final void Function(String?)? onChanged;
 final  bool isSelected;
  @override
  State<CustomRadioList> createState() => _CustomRadioListState();
}

class _CustomRadioListState extends State<CustomRadioList> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.withOpacity(.2),
        border:widget.isSelected?  Border.all(
          color: Styles.primaryColor, // border color
          width: 2,           // border width
        ):null
      ),
      child:Expanded(child: Center(
        child: RadioListTile(
            value: widget.value,
            groupValue:widget.selectedValue,
            fillColor: MaterialStateProperty.resolveWith<Color>(
                    (states){
                  if(states.contains(MaterialState.selected)){
                    return Colors.black;
                  } return Colors.grey;
                }
            ),
            title: Text(widget.title,style: Styles.semiBold13,),
            subtitle: Text(widget.subTitle,style: Styles.regular13.copyWith(color: Colors.grey),),
            secondary: Text(widget.secondary,style: Styles.bold19.copyWith(color: Styles.primaryColor)),
            onChanged:widget.onChanged,
      )) ,
    ));
  }
}