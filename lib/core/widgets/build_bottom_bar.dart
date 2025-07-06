import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/cart_view/presentation/views/cart_view.dart';
import 'package:fruits_hub/features/profile_view/presentation/views/my_account_view.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../features/home_view/presentation/views/home_view.dart';
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
        CartView(),
         MyAccountView()
      ],
      items: [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            activeColorPrimary: Colors.deepOrange,
            inactiveColorPrimary: Colors.grey,
            activeColorSecondary: Colors.green,
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.grid_view_rounded),
            activeColorPrimary: Colors.deepOrange,
            inactiveColorPrimary: Colors.grey,
            activeColorSecondary: Colors.green),

        PersistentBottomNavBarItem(
            icon: const Icon(Icons.add_shopping_cart_outlined),
            activeColorPrimary: Colors.deepOrange,
            inactiveColorPrimary: Colors.grey,
            activeColorSecondary: Colors.green),

        PersistentBottomNavBarItem(
            icon: const Icon(Icons.person),
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
