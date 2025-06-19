

import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';

import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem(CartItemEntity cartItemEntity){
    cartItems.add(cartItemEntity);
  }

  removeCartItem(CartItemEntity cartItemEntity){
    cartItems.remove(cartItemEntity);
  }

  bool isProductExist(ProductEntity productEntity) {
    for (var cartItemEntity in cartItems) {
      if (cartItemEntity.productEntity.id == productEntity.id) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity productEntity){
    for (var cartItemEntity in cartItems) {
      if (cartItemEntity.productEntity.id == productEntity.id) {
        return cartItemEntity;
      }
    }
    return CartItemEntity(productEntity:productEntity,count: 1);
  }
  num calculateNumOfProducts(){
    num numOfProducts=0;
    for(var cartItemEntity in cartItems){
      numOfProducts=numOfProducts+cartItemEntity.count;
    }return numOfProducts;
  }

  num calculateTotalPrice(){
    num totalPrice=0;
    for(var cartItemEntity in cartItems){
      totalPrice=totalPrice+cartItemEntity.calculateTotalPrice();
    }return totalPrice;
  }
}
