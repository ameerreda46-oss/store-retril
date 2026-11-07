import 'package:flutter/material.dart';
import '../providers/store_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'explore_screen.dart';
import 'cart_screen.dart';
import 'favorites_screen.dart';
import 'profile_screen.dart';

class MainNavScreen extends StatelessWidget {
  const MainNavScreen({super.key});

  final List<Widget> _pages = const [
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final store = StoreScope.of(context);

    return Scaffold(
      body: IndexedStack(
        index: store.selectedBottomNavIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: store.selectedBottomNavIndex,
        onTap: (index) {
          store.setSelectedBottomNavIndex(index);
        },
      ),
    );
  }
}
