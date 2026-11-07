import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../theme/app_theme.dart';
import 'app_illustrations.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 155,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFF0F0F0), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: ProductImageWidget(
                  emoji: product.iconEmoji,
                  size: 70,
                ),
              ),
              const SizedBox(height: 12),
              // Name
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              // Subtitle/unit
              Text(
                '1${product.unit},priceg',
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              // Price and Add Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Text(
                    '\$ ${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                    ),
                  ),
                  InkWell(
                    onTap: onAddToCart,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppColors.greenLight,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
