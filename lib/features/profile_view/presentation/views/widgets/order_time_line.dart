import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
import '../../../../../core/utilis/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../shipping_view/domain/entity/order_entity.dart';

class OrderTimeline extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderTimeline({
    super.key,
    required this.orderEntity,
  });

  @override
  Widget build(BuildContext context) {
    final List<StepData> stepData = [
      StepData(
        label: S.of(context).orderfollowing,
        date: orderEntity.followOrder,
      ),
      StepData(
        label: S.of(context).orderaccepted,
        date: orderEntity.acceptOrder,
      ),
      StepData(
        label:S.of(context).ordershipping,
        date: orderEntity.shippingOrder,
      ),
      StepData(
        label: S.of(context).orderout,
        date: orderEntity.deliveryOrder,
      ),
      StepData(
        label: S.of(context).orderdelivered,
        date: orderEntity.delivered,
      ),
    ];

    return SizedBox(
      height: 220,
      child: Timeline.tileBuilder(

        theme: TimelineThemeData(
          direction: Axis.vertical,
          connectorTheme: const ConnectorThemeData(
            thickness: 2.5,
          ),
        ),

        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: stepData.length,
          indicatorPositionBuilder: (context, index) => 0.2,
          indicatorBuilder: (context, index) {
            final isCompleted = stepData[index].date != null;
            return isCompleted
                ? DotIndicator(
              color: Styles.primaryColor,
              size: 24,
              child: const Icon(Icons.check, size: 12, color: Colors.white),
            )
                : DotIndicator(
              color: Colors.grey[400],
              size: 20,
            );
          },
          connectorBuilder: (context, index, _) => SolidLineConnector(
            color: stepData[index].date != null
                ? Styles.primaryColor
                : Colors.grey[300],
          ),
          contentsBuilder: (context, index) {
            final step = stepData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    step.label,
                    style: step.date != null
                        ? Styles.bold16.copyWith(color: Styles.primaryColor)
                        : Styles.bold16.copyWith(color: Colors.grey),
                  ),
                  Spacer(),
                  if (step.date != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        step.date!,
                        style: Styles.bold19,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}

// Helper class to hold label + date
class StepData {
  final String label;
  final String? date;
  StepData({required this.label, this.date});
}
