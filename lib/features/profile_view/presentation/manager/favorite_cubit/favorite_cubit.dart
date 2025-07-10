import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';

import '../../../domain/entities/favorite_entity.dart';


part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  final FavoriteEntity favoriteEntity = FavoriteEntity(favoriteItems: []);

  void addFavorite({required ProductEntity productEntity}) {

    final isFavorite = favoriteEntity.isProductFavorite(productEntity);
    if (isFavorite) {
      favoriteEntity.removeFavorite(productEntity);
      emit(FavoriteRemoved());
    } else {
      favoriteEntity.addFavorite(productEntity);
      emit(FavoriteAdded());
    }
  }

  void removeFavorite({required ProductEntity productEntity}) {
    favoriteEntity.removeFavorite(productEntity);
    emit(FavoriteRemoved());
  }

  void clearFavorites() {
    favoriteEntity.clearFavorites();
    emit(FavoritesCleared());
  }



  List<ProductEntity> getFavorites() {
    return favoriteEntity.favoriteItems;
  }
}