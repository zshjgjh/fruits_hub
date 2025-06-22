import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../../../core/utilis/save_user_locally.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../core/widgets/build_bottom_bar.dart';
import '../../../../generated/assets.dart';
import '../../../cart_view/presentation/manager/cart_cubit.dart';
import '../../../home_view/presentation/views/home_view.dart';
import '../../domain/entity/order_entity.dart';
import '../manager/get_orders_cubit/get_orders_cubit.dart';
import 'order_details_view.dart';

class SuccessPaymentView extends StatefulWidget {
  const SuccessPaymentView({super.key});

  @override
  State<SuccessPaymentView> createState() => _SuccessPaymentViewState();
}

class _SuccessPaymentViewState extends State<SuccessPaymentView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetOrdersCubit>(context).getOrdersByUser(
      userEntity: getUserDataLocally(),
    );
  }

  List<OrderEntity> orders = [];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<GetOrdersCubit, GetOrdersState>(
            listener: (BuildContext context, state) {
              if (state is GetOrdersFailure) {
                isLoading = false;
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Fail to fetch order...please try again later',
                    style: Styles.bold19,
                  ),
                  backgroundColor: Colors.red,
                ));
              } else if (state is GetOrdersSuccess) {
                orders = state.orders;
                isLoading = false;
                setState(() {});
              } else {
                isLoading = true;
                setState(() {});
              }
            },
            child: ModalProgressHUD(
                inAsyncCall: isLoading,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      buildAppBar(context, title: '', isArrowExists: true,
                          onPressed: () {
                        PersistentNavBarNavigator.pop(context);
                      }),
                      Image.asset(Assets.imagesGreenCheck),
                      Text('Success', style: Styles.bold19),
                      orders.isEmpty
                          ? SizedBox()
                          : Text('Order number: ${orders.last.id}',
                              style: Styles.bold19),
                      Spacer(),
                      CustomButton(
                        title: 'Home',
                        height: 55,
                        width: double.infinity,
                        backgroundColor: Styles.primaryColor,
                        borderRadius: 16,
                        titleStyle: Styles.bold19.copyWith(color: Colors.white),
                        onPressed: () {
                          Provider.of<TabControllerProvider>(context,
                                  listen: false)
                              .controller
                              .index = 0;

                          BlocProvider.of<CartCubit>(context).clearCart();

                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                      ),
                      CustomButton(
                        title: 'Order Details',
                        height: 55,
                        width: double.infinity,
                        backgroundColor: Styles.primaryColor,
                        borderRadius: 16,
                        titleStyle: Styles.bold19.copyWith(color: Colors.white),
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: OrderDetailsView(),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                      )
                    ],
                  ),
                )
            )
        )
    );
  }
}
