import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesClock),
        Text('apple'),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.close))
      ],);
  }
}
