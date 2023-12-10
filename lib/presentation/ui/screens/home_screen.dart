import 'package:crafty_bay_testing_project/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay_testing_project/presentation/ui/utility/image_assets.dart';
import 'package:crafty_bay_testing_project/presentation/ui/widgets/category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
              const HomeSlider(),
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
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const CategoryCardWidget();
                    }),
              ),
              const SizedBox(
                height: 2,
              ),
              SectionHeader(title: 'New', onTap: () {}),
              SizedBox(
                height: 165,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ProductCardWidget();
                  },
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SectionHeader(title: 'Popular', onTap: () {}),
              SizedBox(
                height: 165,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ProductCardWidget();
                  },
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SectionHeader(title: 'Special', onTap: () {}),
              SizedBox(
                height: 165,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ProductCardWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
