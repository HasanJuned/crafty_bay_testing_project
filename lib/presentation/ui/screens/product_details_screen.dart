import 'package:crafty_bay_testing_project/presentation/ui/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../widgets/custom_stepper.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImageSlider(),
                AppBar(
                  title: Text('Product Details'),
                  leading: BackButton(
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.grey,
                  elevation: 0,
                ),
              ],
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                      child: Text('Asus VivoBook 15 X15399', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 0.7
                      ),),
                    ),
                      CustomStepper(
                        lowerLimit: 1,
                        upperLimit: 10,
                        stepValue: 1,
                        value: 1,
                        onChange: (newValue) {
                          print(newValue);
                        },
                      )
                    ],),
                  Row(
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
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
                      TextButton(onPressed: (){}, child: Text('Review')),
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
