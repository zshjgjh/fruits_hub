// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../features/home_view/data/models/search_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchItemModelAdapter extends TypeAdapter<SearchItemModel> {
  @override
  final int typeId = 0;

  @override
  SearchItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchItemModel(
      title: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SearchItemModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
