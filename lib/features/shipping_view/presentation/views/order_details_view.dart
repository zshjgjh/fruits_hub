import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/shipping_view/domain/entity/order_entity.dart';
import 'package:fruits_hub/features/shipping_view/presentation/manager/get_orders_cubit/get_orders_cubit.dart';

import '../../../../core/utilis/save_user_locally.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../generated/assets.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {

  OrderEntity? orderEntity;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetOrdersCubit>(context).getOrdersByUser(
      userEntity: getUserDataLocally(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetOrdersCubit, GetOrdersState>(
      listener: (context, state) {
      if (state is GetOrdersSuccess && state.orders.isNotEmpty) {
         orderEntity = state.orders.last;
      }

      },
      builder: (context, state) {
        return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.imagesOrder),
                        const SizedBox(height: 16),
                        Text('Order number: ${orderEntity!.id}',
                            style: Styles.semiBold13),
                        const SizedBox(height: 8),
                        Text('Ordered at: 12 June 2025',
                            style: Styles.regular11
                                .copyWith(color: const Color(0xff949D9E))),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text('Total price: ',
                                style: Styles.regular11
                                    .copyWith(color: const Color(0xff949D9E))),
                            Text('${orderEntity!.price}',
                                style: Styles.semiBold13),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
      },
    );
  }
}
