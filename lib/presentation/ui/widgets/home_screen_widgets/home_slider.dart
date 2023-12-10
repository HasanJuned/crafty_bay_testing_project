import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.8,
            height: 180.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            onPageChanged: (int page, _) {
              _selectedSlider.value = page;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: Image.asset('assets/images/laptop.jpg', fit: BoxFit.cover,));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
            valueListenable: _selectedSlider,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < 5; i++) {
                list.add(Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    color: value == i ? AppColors.primaryColor : null,
                  ),
                ));
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            }),
      ],
    );
  }
}

