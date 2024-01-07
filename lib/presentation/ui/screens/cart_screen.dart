import 'package:crafty_bay_testing_project/presentation/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/main_bottom_nav_bar_controller.dart';
import '../utility/app_colors.dart';
import '../widgets/cart_product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Get.find<MainBottomNavBarController>().backToHome();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
                itemBuilder: (context, index){
              return CartProductCard();
            }),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '\$1000',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Add to Cart'))
              ],
            ),
          )
        ],
      ),
    );
  }
}


