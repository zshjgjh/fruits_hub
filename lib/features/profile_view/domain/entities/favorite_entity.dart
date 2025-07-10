import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';

class FavoriteEntity {
  final List<ProductEntity> favoriteItems;

  FavoriteEntity({required this.favoriteItems});

  void addFavorite(ProductEntity productEntity) {
    if (!isProductFavorite(productEntity)) {
      favoriteItems.add(productEntity);
    }
  }

  void removeFavorite(ProductEntity productEntity) {
    favoriteItems.removeWhere((item) => item.id == productEntity.id);
  }

  bool isProductFavorite(ProductEntity productEntity) {
    for (var favorite in favoriteItems) {
      if (favorite.id == productEntity.id) {
        return true;
      }
    }
    return false;
  }

  void toggleFavorite(ProductEntity productEntity) {
    if (isProductFavorite(productEntity)) {
      removeFavorite(productEntity);
    } else {
      addFavorite(productEntity);
    }
  }

  int getFavoritesCount() {
    return favoriteItems.length;
  }

  void clearFavorites() {
    favoriteItems.clear();
  }
}