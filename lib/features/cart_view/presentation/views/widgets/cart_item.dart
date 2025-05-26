import 'package:flutter/material.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

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
            child: Image.asset(Assets.imagesStrawberry,fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Strawberry',style: Styles.bold16,),
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
                          onPressed: (){},

                          icon: Icon(Icons.add,color: Colors.white,),),
                      ),

                      Text('4',style: Styles.bold16,),

                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color:  Color(0xff979899),
                        ),
                        child: IconButton(
                          onPressed: (){},
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
            child: Container(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Assets.imagesTrash),
                  Text(r'3 $',style: Styles.bold16.copyWith(color: Styles.secondaryColor),)

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}