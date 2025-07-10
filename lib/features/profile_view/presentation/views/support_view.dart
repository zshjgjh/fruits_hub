import 'package:flutter/material.dart';

import '../../../../core/utilis/styles.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../../../../generated/l10n.dart';

class SupportView extends StatefulWidget {
  const SupportView({
    super.key,
  });

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  bool themeValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildAppBar(context,
                        title: S.of(context).aboutus, isArrowExists: true),
                    Text(S.of(context).us,style: Styles.regular13,)
                  ])))
    ]));
  }
}
