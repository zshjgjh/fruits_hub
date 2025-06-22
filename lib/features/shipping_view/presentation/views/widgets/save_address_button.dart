import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utilis/styles.dart';

class SaveAddressSwitchTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const SaveAddressSwitchTile({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Styles.primaryColor,
      title: Text(
        'Save address for next use',
        style: Styles.bold16.copyWith(color: const Color(0xff949D9E)),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
