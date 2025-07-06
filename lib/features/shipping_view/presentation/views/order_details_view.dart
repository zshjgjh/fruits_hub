import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';
import 'package:fruits_hub/features/shipping_view/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/widgets/order_card.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/widgets/order_step.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/utilis/save_user_locally.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  OrderEntity? orderEntity;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetOrdersCubit>(context).getOrdersByUser(
      userEntity: getUserDataLocally(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<GetOrdersCubit, GetOrdersState>(
        listener: (context, state) {
          if (state is GetOrdersSuccess) {
            setState(() {
              isLoading = false;
              orderEntity = state.orders.last;
            });
          } else if (state is GetOrdersFailure) {
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                S.of(context).failfetchorder,
                style: Styles.bold19,
              ),
              backgroundColor: Colors.red,
            ));
          } else {
            setState(() {
              isLoading = true;
            });
          }
        },
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: orderEntity == null
                ? const SizedBox() // لا تعرض شيء حتى نحصل على الطلب
                : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        buildAppBar(
                          context,
                          title: S.of(context).orderdetails,
                          isArrowExists: true,
                        ),
                        const SizedBox(height: 30),
                        OrderCard(orderEntity: orderEntity!),
                        const SizedBox(height: 20),
                        Container(
                          color: Colors.grey.shade100,
                          child: Column(
                            children: [
                              OrderStep(
                                isCompleted: orderEntity!.followOrder==null?false:true,
                                title: S.of(context).orderfollowing,
                                image: Assets.imagesFolloworder,
                                subTitle: orderEntity?.followOrder??''
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 70.0),
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xff4E555633),
                                ),
                              ),
                              OrderStep(
                                isCompleted: orderEntity!.acceptOrder==null?false:true,
                                title: S.of(context).orderaccepted,
                                image: Assets.imagesAcceptorder,
                                subTitle: orderEntity?.acceptOrder??'',
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 60.0),
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xff4E555633),
                                ),
                              ),
                              OrderStep(
                                isCompleted: orderEntity!.shippingOrder==null?false:true,
                                title: S.of(context).ordershipping,
                                image: Assets.imagesOrderShipping,
                                subTitle: orderEntity?.shippingOrder??'',
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 60.0),
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xff4E555633),
                                ),
                              ),
                              OrderStep(
                                isCompleted: orderEntity!.deliveryOrder==null?false:true,
                                title: S.of(context).orderout,
                                image: Assets.imagesDeliveredtrack,
                                subTitle: orderEntity?.deliveryOrder??"",
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 60.0),
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xff4E555633),
                                ),
                              ),
                              OrderStep(
                                isCompleted: orderEntity!.delivered==null?false:true,
                                title: S.of(context).orderdelivered,
                                image: Assets.imagesDelivered,
                                subTitle: orderEntity?.delivered??'',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )

      ),
    );
  }
}
