import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../search_view.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key, this.onSubmitted, this.onChanged, this.onTap, this.onTapOutside,
  });
  final void Function(String)? onSubmitted;
final void Function(String)? onChanged;
final void Function()? onTap;
final Function(PointerDownEvent)? onTapOutside;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside:onTapOutside ,
      onTap:onTap ,
      onSubmitted:onSubmitted ,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Image.asset(Assets.imagesSearch),
        hintText: S.of(context).search,
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