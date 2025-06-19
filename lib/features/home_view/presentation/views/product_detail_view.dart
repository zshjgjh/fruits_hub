import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/cart_view/data/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home_view/domain/entities/product_entity.dart';
import 'package:fruits_hub/features/home_view/presentation/views/reviews_view.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/reviews_view_body.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/product_details_card.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../core/widgets/build_bottom_bar.dart';
import '../../../../generated/assets.dart';
import '../../../cart_view/presentation/manager/cart_cubit.dart';
import '../../../cart_view/presentation/views/cart_view.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.productEntity, required this.cartItemEntity});
  final ProductEntity productEntity;
  final CartItemEntity cartItemEntity;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                      child: Image.asset(Assets.imagesProductbg,fit: BoxFit.cover,)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                      child: Image.network(widget.productEntity.imageUrl??'',)),
                  Positioned(
                      top:10,
                      left:0,
                      right: 10,
                      child: buildAppBar(context, title: '', isArrowExists: true,onPressed: (){ PersistentNavBarNavigator.pop(context);})),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 20,
                  children: [
                    Row(
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         spacing: 10,
                         children: [
                           Text(widget.productEntity.name,style: Styles.bold19,),
                           Row(
                             children: [
                               Text('${widget.productEntity.price}'r' $',style: Styles.bold19.copyWith(color: Styles.secondaryColor),),
                               Text('/ pound',style: Styles.bold16.copyWith(color: Color(0xffF8C76D)),)
                             ],
                           )
                         ],
                       ),
                       Spacer(),
                       Container(
                         height: 40,
                         width: 40,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(90),
                           color:  Color(0xFF1B5E37),
                         ),
                         child: IconButton(
                           onPressed: (){
                             BlocProvider.of<CartCubit>(context).addItem(productEntity:widget.productEntity);
                             widget.cartItemEntity.increaseCount();
                             setState(() {

                             });
                           },

                           icon: Icon(Icons.add,color: Colors.white,),),
                       ),
                       SizedBox(width: 10,),
                       Text('${widget.cartItemEntity.count}',style: Styles.bold16,),
                       SizedBox(width: 10,),
                       Container(
                         height: 40,
                         width: 40,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(90),
                           color:  Color(0xff979899),
                         ),
                         child: IconButton(
                           onPressed: (){
                             BlocProvider.of<CartCubit>(context).removeItem(productEntity:widget.productEntity);
                             widget.cartItemEntity.decreaseCount();
                             setState(() {

                             });
                           },
                           icon: Icon(Icons.minimize,color: Colors.white,),),
                       ),
                       SizedBox(width: 10,),
                     ],
                   ),
                    Row(
                      spacing: 2,
                      children: [
                        Image.asset(Assets.imagesStar),
                        Text(widget.productEntity.avgRating.toStringAsFixed(1)),
                        Text('(+${widget.productEntity.ratingCount})'),
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: ReviewsView(productEntity: widget.productEntity,),
                              withNavBar: true, // OPTIONAL VALUE. True by default.
                            );
                          },
                          child: Text('Reviews',style: Styles.bold19
                              .copyWith(color: Styles.primaryColor,decoration:TextDecoration.underline ),),
                        )

                      ],
                    ),
                    Text(widget.productEntity.description,
                    maxLines: 10,
                    style:Styles.regular13.copyWith(color: Color(0xff979899)),),

                    Row(
                      spacing: 10,
                      children: [
                         Expanded(child: ProductDetailsCard(title: '${widget.productEntity.expMonthes} days', subTitle: 'Expiration', image: Assets.imagesExpire,)),
                         Expanded(child: ProductDetailsCard(title: widget.productEntity.isOrganig?'100%':'0%', subTitle: 'Organig', image: Assets.imagesOrganig,)),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(child: ProductDetailsCard(title: '${widget.productEntity.numOfCalories} Calories', subTitle: '${widget.productEntity.unitAmount} grams', image: Assets.imagesCalorie,)),
                         Expanded(child: ProductDetailsCard(title: widget.productEntity.avgRating.toStringAsFixed(1), subTitle: 'Reviews', image: Assets.imagesReview,)),
                      ],
                    ),
                    SizedBox(height: 20,),
                    CustomButton(
                        onPressed: (){
                          if(widget.cartItemEntity.count==0) {
                            BlocProvider.of<CartCubit>(context).addItem(
                                productEntity: widget.productEntity);

                            Provider
                                .of<TabControllerProvider>(
                                context, listen: false)
                                .controller
                                .index = 2;
                          }else{
                            Provider
                                .of<TabControllerProvider>(
                                context, listen: false)
                                .controller
                                .index = 2;
                          }

                        },
                        title: 'Add To Cart',
                        backgroundColor: Styles.primaryColor,
                        borderRadius: 16,
                        titleStyle: Styles.bold16.copyWith(color: Colors.white),
                        height: 54
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

