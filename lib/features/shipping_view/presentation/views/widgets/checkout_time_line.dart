import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
import '../../../../../core/utilis/styles.dart';

class CheckoutTimeline extends StatelessWidget {
  final int currentStep;
  final Function(int) onStepTapped;
  final List<String> steps;
  final int maxStepReached;

  const CheckoutTimeline({
    super.key,
    required this.currentStep,
    required this.onStepTapped,
    required this.steps,
    required this.maxStepReached,
  });

  @override
  Widget build(BuildContext context) {
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
            bool isCompleted = index < maxStepReached;
            bool isCurrent = index == currentStep;
            bool isEnabled = index <= maxStepReached;

            return GestureDetector(
              onTap: () {
                if (isEnabled) onStepTapped(index);
              },
              child: isCompleted
                  ? DotIndicator(
                color: Styles.primaryColor,
                size: 42,
                child: const Icon(Icons.check, color: Colors.white, size: 14),
              )
                  : DotIndicator(
                color: isCurrent
                    ? Styles.secondaryColor
                    : Colors.grey[400],
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
            color: index < maxStepReached
                ? Styles.primaryColor
                : Colors.grey[300],
          ),
          contentsBuilder: (_, index) => Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              steps[index],
              textAlign: TextAlign.center,
              style: index == currentStep
                  ? Styles.bold16.copyWith(color: Styles.secondaryColor)
                  : index < maxStepReached
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

