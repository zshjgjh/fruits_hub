import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/product_details_card.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';
import '../../../cart_view/presentation/views/cart_view.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
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
                  Image.asset(Assets.imagesStrawberry),
                  Positioned(
                      top:10,
                      left:0,
                      right: 10,
                      child: buildAppBar(context, title: '')),
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
                           Text('straberry',style: Styles.bold19,),
                           Row(
                             children: [
                               Text(r'20 $',style: Styles.bold19.copyWith(color: Styles.secondaryColor),),
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
                           onPressed: (){},

                           icon: Icon(Icons.add,color: Colors.white,),),
                       ),
                       SizedBox(width: 10,),
                       Text('4',style: Styles.bold16,),
                       SizedBox(width: 10,),
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
                       SizedBox(width: 10,),
                     ],
                   ),
                    Row(
                      spacing: 2,
                      children: [
                        Image.asset(Assets.imagesStar),
                        Text('4.3'),
                        Text('(+30)'),
                        SizedBox(width: 10,),
                        Text('Reviews',style: Styles.bold19
                            .copyWith(color: Styles.primaryColor,decoration:TextDecoration.underline ),)

                      ],
                    ),
                    Text('hjdfj,djfjdjds,djhfjdhfj,jdfhhjdjsd,,mnknmnmnjv.gfg,hgfghjdfjdhjdjdjcjdjdkhskjhskjhkjhjkhfjk',
                    maxLines: 10,
                    style:Styles.regular13.copyWith(color: Color(0xff979899)),),

                    Row(
                      spacing: 10,
                      children: [
                         Expanded(child: ProductDetailsCard(title: '3 days', subTitle: 'Expiration', image: Assets.imagesExpire,)),
                         Expanded(child: ProductDetailsCard(title: '100%', subTitle: 'Organig', image: Assets.imagesOrganig,)),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(child: ProductDetailsCard(title: '80 calories', subTitle: '100 grams', image: Assets.imagesCalorie,)),
                         Expanded(child: ProductDetailsCard(title: '4.8', subTitle: 'Reviews', image: Assets.imagesReview,)),
                      ],
                    ),
                    SizedBox(height: 20,),
                    CustomButton(
                        onPressed: (){
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: CartView(),
                            withNavBar: true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                          );
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

