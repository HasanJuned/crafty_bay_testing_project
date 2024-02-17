import 'package:crafty_bay_testing_project/data/model/category_data.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key, required this.categoryData,
  });

  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.network(categoryData.categoryImg ?? ''),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          categoryData.categoryName ?? '',
          style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 15,
              letterSpacing: 0.4),
        )
      ],
    );
  }
}
