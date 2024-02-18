import 'package:crafty_bay_testing_project/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/popular_product_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/slider_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/special_product_controller.dart';
import 'package:crafty_bay_testing_project/presentation/ui/utility/image_assets.dart';
import 'package:crafty_bay_testing_project/presentation/ui/widgets/category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../state_holders/new_product_controller.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/section_header.dart';
import '../widgets/home_screen_widgets/home_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.craftyBayAppBarPhotoSvg),
            const Spacer(),
            CircularIconButton(
              onTap: () {},
              icon: Icons.person,
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              onTap: () {},
              icon: Icons.call,
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              onTap: () {},
              icon: Icons.notifications_active,
            ),
            const SizedBox(
              width: 4,
            ),
            CircularIconButton(
              onTap: () {
                AuthController.clearUserInfo();
              },
              icon: Icons.logout,
            ),
            const SizedBox(
              width: 4,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<SliderController>(builder: (sliderController) {
                if (sliderController.sliderControllerInProgress) {
                  return const SizedBox(
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return HomeSlider(
                  sliders: sliderController.sliderModel.data ?? [],
                );
              }),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(
                title: 'Categories',
                onTap: () {
                  Get.find<MainBottomNavBarController>().changeScreen(1);
                },
              ),
              SizedBox(
                height: 100,
                child: GetBuilder<CategoryController>(
                    builder: (categoryController) {
                  if (categoryController.categoryControllerInProgress) {
                    return const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return ListView.builder(
                      itemCount:
                          categoryController.categoryModel.data?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryCardWidget(
                          categoryData:
                              categoryController.categoryModel.data![index],
                        );
                      });
                }),
              ),
              const SizedBox(
                height: 2,
              ),
              SectionHeader(title: 'New', onTap: () {}),
              SizedBox(
                height: 190,
                child: GetBuilder<NewProductController>(
                  builder: (newProductController) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newProductController.productsByRemarksModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ProductCardWidget(
                          productData: newProductController.productsByRemarksModel.data![index],
                        );
                      },
                    );
                  }
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SectionHeader(title: 'Popular', onTap: () {}),
              SizedBox(
                height: 190,
                child: GetBuilder<PopularProductController>(
                  builder: (popularProductController) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularProductController.productsByRemarksModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ProductCardWidget(
                          productData: popularProductController.productsByRemarksModel.data![index],
                        );
                      },
                    );
                  }
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SectionHeader(title: 'Special', onTap: () {}),
              SizedBox(
                height: 190,
                child: GetBuilder<SpecialProductController>(
                  builder: (specialProductController) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: specialProductController.productsByRemarksModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ProductCardWidget(
                          productData: specialProductController.productsByRemarksModel.data![index],
                        );
                      },
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
