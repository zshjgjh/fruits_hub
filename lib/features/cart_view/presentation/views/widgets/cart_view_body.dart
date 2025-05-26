import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/cart_view/presentation/views/widgets/cart_item.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 20,
                    children: [
                      buildAppBar(context, title: 'Cart'),
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: double.infinity,
                        color: Color(0xffEBF9F1),
                        child: Text('You have 3 items in cart',style: Styles.semiBold13.copyWith(color: Styles.primaryColor),),
                      ),
                      SizedBox(height: 20,)




                    ],
                  ),
                ),
              ),
              SliverList(delegate: SliverChildBuilderDelegate(
                childCount: 3,
                      (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: CartItem(),
                        );
                      })),

              SliverFillRemaining(child:
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                  child: Column(
                    children: [
                      Spacer(),
                      CustomButton(
                          onPressed: (){},
                          title: r'Pay 20 $',
                          backgroundColor: Styles.primaryColor,
                          borderRadius: 16,
                          titleStyle: Styles.bold16.copyWith(color: Colors.white),
                          height: 54
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }
}