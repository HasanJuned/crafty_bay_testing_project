import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import 'custom_stepper.dart';
class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/laptop.jpg'))
            ),
          ),
          const SizedBox(width: 6,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text('Asus VivoBook 15',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18
                            ),),
                            SizedBox(height: 4,),
                            RichText(
                              text: TextSpan(
                                  style:
                                  TextStyle(color: Colors.grey),
                                  children: [
                                    TextSpan(text: 'Color: Black'),
                                    TextSpan(text: 'Size: XL'),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$ 1000', style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),),
                      CustomStepper(
                          lowerLimit: 1,
                          upperLimit: 10,
                          stepValue: 1,
                          value: 1,
                          onChange: (int value) {})
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
