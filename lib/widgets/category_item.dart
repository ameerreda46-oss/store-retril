import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../theme/app_theme.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;
  final double size;

  const CategoryItem({
    super.key,
    required this.category,
    required this.onTap,
    this.size = 72,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: category.bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              category.icon,
              color: category.iconColor,
              size: size * 0.45,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
