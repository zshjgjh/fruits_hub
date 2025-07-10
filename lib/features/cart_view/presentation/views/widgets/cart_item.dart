import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../domain/entities/cart_item_entity.dart';
import '../../manager/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity, this.onPressedPlus, this.onPressedMinus, this.onPressedDelete});

final CartItemEntity cartItemEntity;
final void Function()? onPressedPlus;
final void Function()? onPressedMinus;
final void Function()? onPressedDelete;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            width: 1,
            color: Color(0xffF1F1F5)
        ),),
      child: Row(
        children: [
          Container(
            height:100,
            color:Color(0xffF3F5F7),
            child: Image.network(cartItemEntity.productEntity.imageUrl??'',fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cartItemEntity.productEntity.name,style: Styles.bold16,),
                  Row(
                    spacing: 10,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color:  Color(0xFF1B5E37),
                        ),
                        child: IconButton(
                          onPressed: onPressedPlus,

                          icon: Icon(Icons.add,color: Colors.white,),),
                      ),

                      Text('${cartItemEntity.count}',style: Styles.bold16,),

                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color:  Color(0xff979899),
                        ),
                        child: IconButton(
                          onPressed: onPressedMinus,
                          icon: Icon(Icons.minimize,color: Colors.white,),),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onPressedDelete,
                      child: Image.asset(Assets.imagesTrash)
                  ),
                  Row(
                    children: [
                      Text('${cartItemEntity.calculateTotalPrice()}'r' $',
                        style: Styles.bold16.copyWith(color: Styles.secondaryColor),),
                    ],
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}