import 'package:flutter/material.dart';
import '../providers/store_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = StoreScope.of(context);
    final favorites = store.favoriteProducts;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: favorites.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border_rounded,
                      size: 80,
                      color: AppColors.primary.withOpacity(0.5),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'No favorite items yet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Tap the heart icon on any product to save it here.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: favorites.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = favorites[index];
                  return ProductCard(
                    product: product,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(product: product),
                        ),
                      );
                    },
                    onAddToCart: () {
                      store.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.name} added to cart!'),
                          backgroundColor: AppColors.green,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
