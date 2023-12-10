import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.shop,
            size: 40,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'Electronics',
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 15,
              letterSpacing: 0.4),
        )
      ],
    );
  }
}
