import 'package:crafty_bay_testing_project/data/model/product_details_data.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay_testing_project/presentation/ui/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColor = 0;
  int _selectedSize = 0;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProductDetailsController>(
            builder: (productDetailsController) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ProductImageSlider(
                            imageList: [
                              productDetailsController
                                      .productDetailsData.img1 ??
                                  '',
                              productDetailsController
                                      .productDetailsData.img2 ??
                                  '',
                              productDetailsController
                                      .productDetailsData.img3 ??
                                  '',
                              productDetailsController
                                      .productDetailsData.img4 ??
                                  '',
                            ],
                          ),
                          productDetailsAppBar,
                        ],
                      ),
                      productDetails(
                          productDetailsController.productDetailsData),
                    ],
                  ),
                ),
              ),
              addToCartBottomContainer(
                productDetailsController.productDetailsData,
                productDetailsController.availableColors,
                productDetailsController.availableSizes,
              ),
            ],
          );
        }),
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      title: const Text('Product Details'),
      leading: const BackButton(
        color: Colors.black,
      ),
      backgroundColor: Colors.grey,
      elevation: 0,
    );
  }

  Container addToCartBottomContainer(ProductDetailsData productDetailsData,
      List<String> colors, List<String> size) {
    return Container(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '\$${productDetailsData.product?.price ?? 'Unknown'}',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          GetBuilder<AddToCartListController>(
              builder: (addToCartListController) {
            if (addToCartListController.cartListControllerInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ElevatedButton(
              onPressed: () {
                addToCartListController
                    .addToCartList(
                  productDetailsData.productId!,
                  colors[_selectedColor],
                  size[_selectedSize],
                  quantity,
                ).then((result) {
                  if (result) {
                    Get.showSnackbar(
                      const GetSnackBar(
                        title: 'Added to Cart',
                        message: 'This product has been added to cart',
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.green,
                        snackPosition: SnackPosition.TOP,
                      ),
                    );
                  } else {
                    Get.showSnackbar(const GetSnackBar(
                      title: 'Failed to add cart',
                      message: 'Try again!',
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.redAccent,
                      snackPosition: SnackPosition.TOP,
                    ));
                  }
                });
              },
              child: const Text('Add to Cart'),
            );
          })
        ],
      ),
    );
  }

  Padding productDetails(ProductDetailsData productDetailsData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetailsData.product?.title ?? 'Unknown',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
              CustomStepper(
                lowerLimit: 1,
                upperLimit: 10,
                stepValue: 1,
                value: 1,
                onChange: (newValue) {
                  quantity = newValue;
                },
              )
            ],
          ),
          Row(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    '${productDetailsData.product?.star ?? 0}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              TextButton(onPressed: () {}, child: const Text('Review')),
              const Card(
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
          const Text(
            'Color',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 28,
            child: SizePicker(
              sizes: productDetailsData.color?.split(',') ?? [],
              onSelected: (int selectedColor) {
                _selectedColor = selectedColor;
              },
              initialSelected: 0,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Size',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 28,
            child: SizePicker(
              sizes: productDetailsData.size?.split(',') ?? [],
              onSelected: (int selectedSize) {
                _selectedSize = selectedSize;
              },
              initialSelected: 0,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(productDetailsData.des ?? 'Unknown')
        ],
      ),
    );
  }
}
