import 'package:crafty_bay_testing_project/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_testing_project/presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay_testing_project/presentation/ui/screens/categories_screen.dart';
import 'package:crafty_bay_testing_project/presentation/ui/screens/wishlist_screen.dart';
import 'package:crafty_bay_testing_project/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class MainBottomNavBarScreen extends StatelessWidget {
  const MainBottomNavBarScreen({Key? key}) : super(key: key);

  final List<Widget> _screens = const[
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavBarController>(
      builder: (mainBottomNavBarController) {
        return Scaffold(
          body: _screens[mainBottomNavBarController.currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: mainBottomNavBarController.currentSelectedIndex,
            onTap: mainBottomNavBarController.changeScreen,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined), label: 'Wish'),
            ],
          ),
        );
      },
    );
  }
}
