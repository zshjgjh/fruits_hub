import 'package:flutter/material.dart';

import 'package:fruits_hub/features/home_view/presentation/views/widgets/home_view_body.dart';


import '../../../../core/utilis/save_user_locally.dart';
import '../../../../core/widgets/build_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabControllerProvider>(context);

    return Scaffold(
      body:HomeViewBody(),
      bottomNavigationBar: buildBottomBar(tabProvider: tabProvider ),
    );
  }
}


