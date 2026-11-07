import 'package:flutter/material.dart';
import '../providers/store_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/app_illustrations.dart';
import '../widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = StoreScope.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Cart',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: store.cart.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined,
                      size: 80,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Your cart is empty',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 180,
                      child: CustomButton(
                        text: 'Go Shopping',
                        onPressed: () {
                          store.setSelectedBottomNavIndex(0);
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      itemCount: store.cart.length,
                      separatorBuilder: (_, __) => const Divider(height: 1, color: AppColors.border),
                      itemBuilder: (context, index) {
                        final item = store.cart[index];

                        return Dismissible(
                          key: Key('${item.product.id}_$index'),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) {
                            store.removeFromCart(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${item.product.name} removed'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 24),
                            color: const Color(0xFFB71C1C), // Red delete background from Screenshot 6
                            child: const Icon(
                              Icons.delete_outline_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              children: [
                                // Product Image
                                ProductImageWidget(
                                  emoji: item.product.iconEmoji,
                                  size: 60,
                                ),
                                const SizedBox(width: 14),

                                // Product Info & Counter
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.product.name,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textDark,
                                        ),
                                      ),
                                      const SizedBox(height: 8),

                                      // Quantity Counter (- qty +)
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: AppColors.inputBackground,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                              onTap: () => store.updateCartQuantity(index, -1),
                                              child: const Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Icon(Icons.remove, size: 16, color: AppColors.textDark),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: Text(
                                                '${item.quantity}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.textDark,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () => store.updateCartQuantity(index, 1),
                                              child: const Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Icon(Icons.add, size: 16, color: AppColors.textDark),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Price
                                Text(
                                  '\$${item.totalPrice.toStringAsFixed(2).replaceAll('.', ',')} ${item.product.unit}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Bottom CheckOut Section
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Amount:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            Text(
                              '\$${store.cartTotal.toStringAsFixed(2).replaceAll('.', ',')}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        CustomButton(
                          text: 'CheckOut',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: const Text(
                                  'Order Confirmed! 🎉',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  'Thank you for your order!\nTotal: \$${store.cartTotal.toStringAsFixed(2)}\nEstimated delivery: 45 mins.',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(height: 1.4),
                                ),
                                actions: [
                                  Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () {
                                        store.clearCart();
                                        Navigator.of(ctx).pop();
                                      },
                                      child: const Text('Back to Home'),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
