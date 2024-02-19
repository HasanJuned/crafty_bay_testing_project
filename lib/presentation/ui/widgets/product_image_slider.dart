import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({Key? key, required this.imageList})
      : super(key: key);
  final List<String> imageList;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            height: 320.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            onPageChanged: (int page, _) {
              _selectedSlider.value = page;
            },
          ),
          items: widget.imageList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    image: DecorationImage(
                      image: NetworkImage(i),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _selectedSlider,
              builder: (context, value, _) {
                List<Widget> list = [];
                for (int i = 0; i < widget.imageList.length; i++) {
                  list.add(Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: value == i ? AppColors.primaryColor : Colors.white,
                    ),
                  ));
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list,
                );
              }),
        ),
      ],
    );
  }
}
