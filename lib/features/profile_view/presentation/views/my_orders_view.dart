import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utilis/save_user_locally.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/widgets/order_item.dart';
import 'package:fruits_hub/features/shipping_view/presentation/views/widgets/order_card.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../shipping_view/domain/entity/order_entity.dart';
import '../../../shipping_view/presentation/manager/get_orders_cubit/get_orders_cubit.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  bool isExpanded = false;
  bool isLoading = false;
  List<OrderEntity> orders = [];
  @override
  void initState(){
    super.initState();
    BlocProvider.of<GetOrdersCubit>(context).getOrdersByUser(userEntity: getUserDataLocally());
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<GetOrdersCubit, GetOrdersState>(
        listener: (context, state) {
          if (state is GetOrdersSuccess) {
            isLoading = false;
            orders = state.orders;
            setState(() {});
          }
          if (state is GetOrdersFailure) {
            isLoading = false;
            setState(() {});
          } else {
            isLoading = false;
            setState(() {});
          }
        },
        child: Scaffold(
            body: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      buildAppBar(context, title: S.of(context).myorders,
                          isArrowExists: true,onPressed: (){
                            PersistentNavBarNavigator.pop(context);
                          }),

                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: Duration(milliseconds: 500 + index * 100),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, (1 - value) * 20),
                            child: child,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: OrderItem(orderEntity: orders[index]),
                      ),
                    );
                  },
                  childCount: orders.length,
                ),
              )

            ],
          ),
        )));
  }
}
