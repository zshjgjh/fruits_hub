import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/cart_view/data/entities/cart_entity.dart';
import 'package:fruits_hub/features/cart_view/presentation/manager/cart_cubit.dart';
import 'package:fruits_hub/features/cart_view/presentation/views/widgets/cart_item.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/shipping_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../shipping_view/presentation/views/ship_view_body.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key, required this.cartEntity});
 final CartEntity cartEntity;

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  spacing: 20,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildAppBar(context, title: 'Cart', isArrowExists: false),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      color: Color(0xffEBF9F1),
                      child: Text('You have ${widget.cartEntity.calculateNumOfProducts()} items in cart',style: Styles.semiBold13.copyWith(color: Styles.primaryColor),),
                    ),
                    SizedBox(height: 20,)




                  ],
                ),
              ),
              SliverList(delegate: SliverChildBuilderDelegate(
                childCount: widget.cartEntity.cartItems.length,
                      (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child:CartItem(cartItemEntity: widget.cartEntity.cartItems[index],
                          onPressedPlus: (){
                            BlocProvider.of<CartCubit>(context).addItem(productEntity:widget.cartEntity.cartItems[index].productEntity);
                            setState(() {

                            });
                          },
                          onPressedMinus: (){
                            BlocProvider.of<CartCubit>(context).removeItem(productEntity:widget.cartEntity.cartItems[index].productEntity);
                            setState(() {

                            });
                          },
                          onPressedDelete: (){
                            BlocProvider.of<CartCubit>(context).cartEntity.cartItems[index].count=0;
                            widget.cartEntity.cartItems.remove(widget.cartEntity.cartItems[index]);
                            setState(() {

                            });
                          },),
                        );
                      })),

              SliverFillRemaining(child:
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                  child: Column(
                    children: [
                      Spacer(),
                      CustomButton(
                          onPressed: (){
                            if (widget.cartEntity.cartItems.isNotEmpty) {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: ShipViewBody(cartEntity: widget.cartEntity,),
                                withNavBar: true, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                              );
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cart is empty')));
                            }
                          },
                          title: 'Pay  ${widget.cartEntity.calculateTotalPrice()}'r'  $',
                          backgroundColor: Styles.primaryColor,
                          borderRadius: 16,
                          titleStyle: Styles.bold19.copyWith(color: Colors.white),
                          height: 54,
                          isDisabled: widget.cartEntity.cartItems.isEmpty?true:false,
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