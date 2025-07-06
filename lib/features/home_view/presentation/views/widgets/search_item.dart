import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import '../../../data/models/search_item_model.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({
    super.key, required this.searchItemModel, this.onPressed,
  });
final SearchItemModel searchItemModel;
final void Function()? onPressed;

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesClock),
        Text(widget.searchItemModel.title),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.close))
      ],);
  }
}
