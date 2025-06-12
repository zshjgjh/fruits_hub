import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/shipping_view/domain/order_entity.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/widgets/checkout_time_line.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/shipping_view.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';


import '../../../../../core/utilis/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/assets.dart';

class ReviewView extends StatefulWidget {
  const ReviewView({
    super.key, required this.orderEntity, required this.onNext,
  });
  final OrderEntity orderEntity;
  final VoidCallback onNext;
  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:CustomScrollView(
          slivers:[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



                  Text('Order Summary:',style: Styles.bold19,),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey.shade300
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 10,
                        children: [
                          Row(
                            children: [
                              Text('Sub total:',style: Styles.regular13.copyWith(color: Colors.grey.shade600),),
                              Spacer(),
                              Text('${widget.orderEntity.price??0}',style: Styles.semiBold16,),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Delivery:',style: Styles.regular13.copyWith(color: Colors.grey.shade600),),
                              Spacer(),
                              Text('${widget.orderEntity.delivery??0}',style: Styles.semiBold13.copyWith(color:Colors.grey.shade600 ),),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(thickness: 2,color: Color(0xffCACECE),),
                          ),
                          Row(
                            children: [
                              Text('Total:',style: Styles.regular13,),
                              Spacer(),
                              Text('${(widget.orderEntity.price??0)+(widget.orderEntity.delivery??0)}',style: Styles.semiBold13 ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),


                  Text('Confirm your order',style: Styles.bold19,),

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey.shade300
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 10,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Payment Method',style: Styles.bold13),
                              Spacer(),
                              Text('edit',style: Styles.semiBold16,),
                              IconButton(onPressed: (){}, icon:Icon(Icons.edit))
                            ],
                          ),
                          Row(
                            crossAxisAlignment:CrossAxisAlignment.end ,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(Assets.imagesVisa),
                              Text('*** *** *** 6522',style: Styles.regular13.copyWith(color: Colors.grey.shade600),),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey.shade300
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 10,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Address',style: Styles.regular13),
                              Spacer(),
                              Text('edit',style: Styles.semiBold16,),
                              IconButton(onPressed: (){}, icon:Icon(Icons.edit))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on_outlined),
                              Text(widget.orderEntity.address??'',style: Styles.regular13.copyWith(color: Colors.grey.shade600),),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    height: 55,
                    title: 'Confirm Order',
                    backgroundColor: Styles.primaryColor,
                    borderRadius: 16,
                    titleStyle: Styles.bold19.copyWith(color: Colors.white),
                    onPressed: () {},
                  )

                ],
                          ),
              ),
            ),


        ],

        ),

    );
  }
}


