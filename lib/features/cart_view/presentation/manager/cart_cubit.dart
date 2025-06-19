import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

import '../../data/entities/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final CartEntity cartEntity=CartEntity(cartItems: []);

  void addItem({required ProductEntity productEntity}){
    var isProductExist=cartEntity.isProductExist(productEntity);
    var cartItemEntity=cartEntity.getCartItem(productEntity);
    if(isProductExist==true){
      cartItemEntity.increaseCount();
    }else{
      cartEntity.addCartItem(cartItemEntity);
    }emit(CartItemAdded());
  }

  void removeItem({required ProductEntity productEntity}){
    var isProductExist=cartEntity.isProductExist(productEntity);
    var cartItemEntity=cartEntity.getCartItem(productEntity);
    if(isProductExist==true){
      cartItemEntity.decreaseCount();
    }else{
      cartEntity.removeCartItem(cartItemEntity);
    }emit(CartItemRemoved());
  }

  void clearCart() {
    cartEntity.cartItems.clear();
    emit(CartCleared());
  }

}
