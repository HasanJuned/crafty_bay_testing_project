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
  List<Color> colors = [
    Colors.deepPurpleAccent,
    Colors.yellow,
    Colors.redAccent,
    Colors.green,
    Colors.black,
  ];

  List<String> sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];

  int _selectedColor = 0;
  int _selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Asus VivoBook 15 X15399',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      letterSpacing: 0.7),
                                ),
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
                            ],
                          ),
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
                              TextButton(onPressed: () {}, child: Text('Review')),
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
                          Text(
                            'Color',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 28,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: colors.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      _selectedColor = index;
                                      if (mounted) {
                                        setState(() {});
                                      }
                                    },
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: colors[index],
                                      child: _selectedColor == index
                                          ? const Icon(
                                              Icons.done,
                                              color: Colors.white,
                                              size: 18,
                                            )
                                          : null,
                                    ),
                                  );
                                },
                              separatorBuilder: (context, index){
                                  return SizedBox(width: 8,);

                              },
                            ),
                          ),

                          SizedBox(height: 12,),
                          Text(
                            'Size',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 28,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: sizes.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      _selectedSize = index;
                                      if (mounted) {
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(4),
                                        color: _selectedSize == index ? AppColors.primaryColor : null
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(sizes[index]),
                                    ),
                                  );
                                },
                              separatorBuilder: (context, index){
                                  return SizedBox(width: 8,);

                              },
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text(
                            'Description',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text('''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),),
                      SizedBox(height: 4,),
                      Text('\$1000', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        color: AppColors.primaryColor
                      ),),
                    ],
                  ),
                  ElevatedButton(onPressed: (){}, child: Text('Add to Cart'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
