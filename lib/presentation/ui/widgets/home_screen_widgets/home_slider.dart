import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/slider_data.dart';
import '../../utility/app_colors.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key, required this.sliders}) : super(key: key);

  final List<SliderData> sliders;

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
          items: widget.sliders.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration:
                      const BoxDecoration(color: AppColors.primaryColor),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.network(
                        i.image ?? '',
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                      Positioned(
                        bottom: 15,
                        left: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              i.title ?? '',
                              style: const TextStyle(
                                color: Colors.brown
                                ,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.3,
                              ),
                            ),
                            const SizedBox(height: 2,),
                            Text(
                              i.price ?? '',
                              style: const TextStyle(
                                color: Colors.brown
                                ,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
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
              for (int i = 0; i < widget.sliders.length; i++) {
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
