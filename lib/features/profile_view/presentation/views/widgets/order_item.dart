import 'package:flutter/material.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/widgets/order_time_line.dart';

import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../shipping_view/domain/entity/order_entity.dart';
import '../../../../shipping_view/presentation/views/widgets/order_card.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key,  required this.orderEntity});

final OrderEntity orderEntity;
  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
    bool isExpanded =false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: OrderCard(orderEntity:widget.orderEntity),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                icon: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                ),
              ),
            ],
          ),
          Divider(thickness: 1,color: Colors.grey.shade300,),
         isExpanded?OrderTimeline(orderEntity: widget.orderEntity,):SizedBox()
        ],
      ),
    );}

}