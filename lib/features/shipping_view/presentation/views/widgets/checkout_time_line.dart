import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
import '../../../../../core/utilis/styles.dart';

class CheckoutTimeline extends StatelessWidget {
  const CheckoutTimeline({
    super.key,
    required this.currentStep,
    required this.onStepTapped,
  });

  final int currentStep;
  final Function(int) onStepTapped;

  @override
  Widget build(BuildContext context) {
    final List<String> steps = ['Shipping', 'Address', 'Payment', 'Review'];

    return SizedBox(
      height: 120,
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: const ConnectorThemeData(thickness: 3.0),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: steps.length,
          itemExtentBuilder: (_, __) =>
          MediaQuery.of(context).size.width / steps.length,
          indicatorBuilder: (_, index) {


            return GestureDetector(
              onTap: () => onStepTapped(index),
              child: index<currentStep
                  ? DotIndicator(
                color: Styles.primaryColor,
                size: 42,
                child: const Icon(Icons.check, color: Colors.white, size: 14),
              )
                  : DotIndicator(
                color: index==currentStep ? Styles.secondaryColor : Colors.grey[400],
                size: 32,
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: Styles.bold19.copyWith(color: Colors.white),
                  ),
                ),
              ),
            );
          },
          connectorBuilder: (_, index, __) => SolidLineConnector(
            color: index < currentStep ? Styles.primaryColor : Colors.grey[300],
          ),
          contentsBuilder: (_, index) => Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              steps[index],
              textAlign: TextAlign.center,
              style: index == currentStep
                  ? Styles.bold16.copyWith(color: Styles.secondaryColor)
                  : index < currentStep
                  ? Styles.bold16.copyWith(color: Styles.primaryColor)
                  : Styles.bold16.copyWith(color: Colors.grey),
            ),
          ),
          indicatorPositionBuilder: (_, __) => 0.2,
        ),
      ),
    );
  }
}