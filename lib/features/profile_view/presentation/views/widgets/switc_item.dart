import 'package:flutter/material.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/widgets/custom_switch_tile.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class SwitchItem extends StatefulWidget {
  const SwitchItem({
    super.key,
    required this.title,
    required this.image,
    required this.value,
   required this.onChanged,
  });
  final String title;
  final String image;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<SwitchItem> createState() => _SwitchItemState();
}

class _SwitchItemState extends State<SwitchItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 10,
          children: [
            Image.asset(widget.image),
            Text(
              widget.title,
              style: Styles.semiBold13.copyWith(color: Color(0xff949D9E)),
            ),
            Spacer(),
            Expanded(child: CustomSwitchTile(value: widget.value, onChanged: widget.onChanged, title: ''))

          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(
            thickness: 0.5,
            color: Color(0xff949D9E),
          ),
        )
      ],
    );
  }
}
