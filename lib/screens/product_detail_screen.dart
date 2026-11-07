import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../providers/store_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/app_illustrations.dart';
import '../widgets/custom_button.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 2;

  @override
  Widget build(BuildContext context) {
    final store = StoreScope.of(context);
    final isFav = widget.product.isFavorite;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primary, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Product Image Display
              Center(
                child: ProductImageWidget(
                  emoji: widget.product.iconEmoji,
                  size: 160,
                ),
              ),

              const SizedBox(height: 32),

              // Title
              Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 6),

              // Price
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    ' /${widget.product.unit}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Description
              Text(
                widget.product.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // Quantity & Favorite row
              Row(
                children: [
                  // Quantity Counter (- qty +)
                  Expanded(
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColors.inputBackground,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (_quantity > 1) {
                                setState(() => _quantity--);
                              }
                            },
                            child: const Icon(Icons.remove, color: AppColors.textDark, size: 20),
                          ),
                          Text(
                            '$_quantity',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() => _quantity++);
                            },
                            child: const Icon(Icons.add, color: AppColors.textDark, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // Heart / Favorite Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        store.toggleFavorite(widget.product);
                      });
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isFav ? AppColors.primary : AppColors.border,
                          width: 1.5,
                        ),
                      ),
                      child: Icon(
                        isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        color: isFav ? AppColors.primary : AppColors.textSecondary,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Add To Cart Button
              CustomButton(
                text: 'Add To cart',
                onPressed: () {
                  store.addToCart(widget.product, quantity: _quantity);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added $_quantity x ${widget.product.name} to cart!'),
                      backgroundColor: AppColors.green,
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
