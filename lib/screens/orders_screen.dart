import 'package:flutter/material.dart';
import '../providers/store_provider.dart';
import '../theme/app_theme.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1); // History tab index 1
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreScope.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primary, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Orders',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textDark,
          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'Ongoing'),
            Tab(text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Ongoing Tab
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.inventory_2_outlined, size: 64, color: AppColors.textSecondary),
                SizedBox(height: 12),
                Text(
                  'No ongoing orders',
                  style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
                ),
              ],
            ),
          ),

          // History Tab (Matching Screenshot 12)
          ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: store.orders.length,
            separatorBuilder: (_, __) => const Divider(height: 1, color: AppColors.border),
            itemBuilder: (context, index) {
              final order = store.orders[index];
              final isDelivered = order.status.toLowerCase() == 'delivered';

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    // Orange Bag Icon in Circle
                    Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),

                    // Order Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order ${order.orderNumber}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            order.status,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isDelivered ? AppColors.greenLight : AppColors.red,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            order.date,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Price
                    Text(
                      '\$${order.totalPrice.toInt()}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
