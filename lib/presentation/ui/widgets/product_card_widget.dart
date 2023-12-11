import 'package:crafty_bay_testing_project/presentation/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: (){
        Get.to(ProductDetailsScreen());
      },
      child: Card(
        shadowColor: AppColors.primaryColor.withOpacity(0.2),
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: 130,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/laptop.jpg',
                          )),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'Nike Show Ak903893',
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$90",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                    ),
                    Wrap(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '4.5',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Card(
                      color: AppColors.primaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}