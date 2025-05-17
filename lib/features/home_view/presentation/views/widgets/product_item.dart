import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.productEntity,
  });
final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey.withOpacity(.2),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              GestureDetector(
                  child: GestureDetector(child: Image.asset(Assets.imagesHeart,height: 25,width: 30,)),),
              SizedBox(
                height: 100,
                  width: 120,
                  child: Image.network('${productEntity.imageUrl}',fit: BoxFit.cover,)),
              Text(productEntity.name,style: Styles.semiBold16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${productEntity.price}',style: Styles.bold16.copyWith(color: Color(0xFFF4A91F)),),
                  Text(r'$ / pound',style: Styles.semiBold16.copyWith(color: Color(0xFFF8C76D)),),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color:  Color(0xFF1B5E37),
                    ),
                    child: IconButton(
                        onPressed: (){},

                        icon: Icon(Icons.add,color: Colors.white,),),
                  )

                ],
              )


            ]

        ),
      ),
    );
  }
}


