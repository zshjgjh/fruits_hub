import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';

class CartItemEntity{
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity,this.count=0});

  num calculateTotalPrice(){
    return productEntity.price*count;
  }

  increaseCount(){
    return count++;
  }

  decreaseCount(){
    count--;
  }

}