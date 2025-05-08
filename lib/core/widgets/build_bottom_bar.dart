import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home_view/presentation/views/widgets/best_seller.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../features/home_view/presentation/views/products_view.dart';
import '../../features/home_view/presentation/views/widgets/home_view_body.dart';

class buildBottomBar extends StatelessWidget {
  const buildBottomBar({
    super.key,
    required this.tabProvider,
  });

  final TabControllerProvider tabProvider;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: tabProvider.controller,
      screens: const [
        HomeViewBody(),
        ProductsView(),

      ],
      items: [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            activeColorPrimary: Colors.deepOrange,
            inactiveColorPrimary: Colors.grey,
            activeColorSecondary: Colors.green),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.grid_view_rounded),
            activeColorPrimary: Colors.deepOrange,
            inactiveColorPrimary: Colors.grey,
            activeColorSecondary: Colors.green),
      ],
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
      ),

      navBarStyle: NavBarStyle.style7,
    );
  }
}

class TabControllerProvider with ChangeNotifier {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  void jumpToTab(int index) {
    controller.jumpToTab(index);
    notifyListeners();
  }
}
