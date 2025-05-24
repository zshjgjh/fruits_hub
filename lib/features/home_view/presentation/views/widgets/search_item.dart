import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import '../../../data/models/search_item_model.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key, required this.searchItemModel,
  });
final SearchItemModel searchItemModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesClock),
        Text(searchItemModel.title),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.close))
      ],);
  }
}
