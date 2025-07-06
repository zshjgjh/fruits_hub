import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/styles.dart';

class CustomSwitchTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String title;

  const CustomSwitchTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Styles.primaryColor,
      title: Text(
        title,
        style: Styles.bold16.copyWith(color: const Color(0xff949D9E)),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
