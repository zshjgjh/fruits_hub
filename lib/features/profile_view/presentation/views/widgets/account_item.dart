import 'package:flutter/material.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/widgets/custom_switch_tile.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class AccountItem extends StatefulWidget {
  const AccountItem({
    super.key,
    required this.title,
    required this.image,
    this.onPressed,
  });
final String title;
final String image;
final  void Function()? onPressed;

  @override
  State<AccountItem> createState() => _AccountItemState();
}

class _AccountItemState extends State<AccountItem> {
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
           IconButton(onPressed:widget.onPressed, icon: Icon(Icons.arrow_forward_ios_outlined)),

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
