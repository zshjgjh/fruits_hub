part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteAdded extends FavoriteState {}

class FavoriteRemoved extends FavoriteState {}

class FavoritesCleared extends FavoriteState {}