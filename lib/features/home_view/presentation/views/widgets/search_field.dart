import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Image.asset(Assets.imagesSearch),
        suffixIcon: Image.asset(Assets.imagesFilter),
        hintText: '   Search for',
        hintStyle: Styles.regular13.copyWith(color: Color(0xFF949D9E)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
              width: 0.01,
              color: Colors.grey.shade200
          ),
        ) ,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 0.1,
            color:  Colors.grey,

          ),
        ) ,
      ),);
  }
}