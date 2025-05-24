import 'package:hive/hive.dart';
part '../../../../generated/search_item_model.g.dart';
@HiveType(typeId: 0)
class SearchItemModel extends HiveObject{
  @HiveField(0)
  final String title;

  SearchItemModel({required this.title});
}