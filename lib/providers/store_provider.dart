import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../models/cart_item_model.dart';
import '../models/order_model.dart';
import '../theme/app_theme.dart';

class StoreNotifier extends ChangeNotifier {
  int _selectedBottomNavIndex = 0;
  String _searchQuery = '';
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'English';

  int get selectedBottomNavIndex => _selectedBottomNavIndex;
  String get searchQuery => _searchQuery;
  bool get notificationsEnabled => _notificationsEnabled;
  String get selectedLanguage => _selectedLanguage;

  void setSelectedBottomNavIndex(int index) {
    _selectedBottomNavIndex = index;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void toggleNotifications(bool value) {
    _notificationsEnabled = value;
    notifyListeners();
  }

  void setLanguage(String lang) {
    _selectedLanguage = lang;
    notifyListeners();
  }

  final List<CategoryModel> categories = [
    CategoryModel(
      id: 'fruits',
      name: 'Fruits',
      icon: Icons.grass,
      bgColor: AppColors.categoryFruit,
      iconColor: const Color(0xFF7B1FA2),
    ),
    CategoryModel(
      id: 'vegtables',
      name: 'Vegtables',
      icon: Icons.eco,
      bgColor: AppColors.categoryVeg,
      iconColor: const Color(0xFFE65100),
    ),
    CategoryModel(
      id: 'meat',
      name: 'Meat',
      icon: Icons.restaurant,
      bgColor: AppColors.categoryMeat,
      iconColor: const Color(0xFFC62828),
    ),
    CategoryModel(
      id: 'fish',
      name: 'Fish',
      icon: Icons.phishing,
      bgColor: AppColors.categoryFish,
      iconColor: const Color(0xFFAD1457),
    ),
    CategoryModel(
      id: 'sea_food',
      name: 'Sea food',
      icon: Icons.set_meal,
      bgColor: AppColors.categorySea,
      iconColor: const Color(0xFFF57F17),
    ),
    CategoryModel(
      id: 'juice',
      name: 'Juice',
      icon: Icons.local_drink,
      bgColor: AppColors.categoryJuice,
      iconColor: const Color(0xFF2E7D32),
    ),
    CategoryModel(
      id: 'egg_milk',
      name: 'Egg & Milk',
      icon: Icons.egg_alt,
      bgColor: AppColors.categoryMilk,
      iconColor: const Color(0xFF00838F),
    ),
    CategoryModel(
      id: 'ice_cream',
      name: 'Ice cream',
      icon: Icons.icecream,
      bgColor: AppColors.categoryIce,
      iconColor: const Color(0xFFD81B60),
    ),
    CategoryModel(
      id: 'cake',
      name: 'Cake',
      icon: Icons.cake,
      bgColor: AppColors.categoryCake,
      iconColor: const Color(0xFF6D4C41),
    ),
  ];

  late final List<ProductModel> products = [
    ProductModel(
      id: 'p1',
      name: 'Red Apple',
      price: 4.99,
      unit: 'kg',
      description: 'Fresh juicy red apples packed with vitamins and natural sweetness.',
      categoryId: 'fruits',
      iconEmoji: '🍎',
    ),
    ProductModel(
      id: 'p2',
      name: 'Orginal Banana',
      price: 5.99,
      unit: 'kg',
      description: 'Fresh organic bananas sourced directly from local farms.',
      categoryId: 'fruits',
      iconEmoji: '🍌',
    ),
    ProductModel(
      id: 'p3',
      name: 'Avocado Bowl',
      price: 24.00,
      unit: 'st',
      description: 'Creamy ripe avocados perfect for delicious guacamole or salads.',
      categoryId: 'vegtables',
      iconEmoji: '🥑',
    ),
    ProductModel(
      id: 'p4',
      name: 'Salmon',
      price: 50.00,
      unit: 'kg',
      description: 'Premium fresh wild Atlantic salmon fillet.',
      categoryId: 'fish',
      iconEmoji: '🥩',
    ),
    ProductModel(
      id: 'p5',
      name: 'Orginal Mango',
      price: 3.00,
      unit: 'st',
      description:
          'Golden Ripe Alphonsa mangoes delivered to your house in the most hygenic way ever... Best for eating plain but can also be made into shakes and cakes.',
      categoryId: 'fruits',
      iconEmoji: '🥭',
    ),
    ProductModel(
      id: 'p6',
      name: 'Fresh Grapes',
      price: 6.50,
      unit: 'kg',
      description: 'Sweet seedless purple grapes rich in antioxidants.',
      categoryId: 'fruits',
      iconEmoji: '🍇',
    ),
  ];

  late final List<CartItemModel> _cart = [
    CartItemModel(
      product: ProductModel(
        id: 'p1',
        name: 'Red Apple',
        price: 4.99,
        unit: 'kg',
        description: 'Fresh juicy red apples.',
        categoryId: 'fruits',
        iconEmoji: '🍎',
      ),
      quantity: 2,
    ),
    CartItemModel(
      product: ProductModel(
        id: 'p2',
        name: 'Orginal Banana',
        price: 5.99,
        unit: 'kg',
        description: 'Fresh organic bananas.',
        categoryId: 'fruits',
        iconEmoji: '🍌',
      ),
      quantity: 2,
    ),
    CartItemModel(
      product: ProductModel(
        id: 'p3',
        name: 'Avocado Bowl',
        price: 24.00,
        unit: 'st',
        description: 'Creamy ripe avocados.',
        categoryId: 'vegtables',
        iconEmoji: '🥑',
      ),
      quantity: 1,
    ),
    CartItemModel(
      product: ProductModel(
        id: 'p4',
        name: 'Salmon',
        price: 50.00,
        unit: 'kg',
        description: 'Premium fresh salmon.',
        categoryId: 'fish',
        iconEmoji: '🥩',
      ),
      quantity: 2,
    ),
  ];

  List<CartItemModel> get cart => _cart;

  final List<OrderModel> orders = [
    OrderModel(
      orderNumber: '#345',
      status: 'Delivered',
      date: 'October 26, 2014',
      totalPrice: 700.0,
    ),
    OrderModel(
      orderNumber: '#346',
      status: 'Cancelled',
      date: 'October 14, 2016',
      totalPrice: 452.0,
    ),
    OrderModel(
      orderNumber: '#347',
      status: 'Delivered',
      date: 'July 26, 2017',
      totalPrice: 281.0,
    ),
  ];

  double get cartTotal {
    double total = 0.0;
    for (var item in _cart) {
      total += item.totalPrice;
    }
    return total;
  }

  void addToCart(ProductModel product, {int quantity = 1}) {
    final existingIndex = _cart.indexWhere((item) => item.product.id == product.id);
    if (existingIndex >= 0) {
      _cart[existingIndex].quantity += quantity;
    } else {
      _cart.add(CartItemModel(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart.removeAt(index);
      notifyListeners();
    }
  }

  void updateCartQuantity(int index, int delta) {
    if (index >= 0 && index < _cart.length) {
      _cart[index].quantity += delta;
      if (_cart[index].quantity <= 0) {
        _cart.removeAt(index);
      }
      notifyListeners();
    }
  }

  void toggleFavorite(ProductModel product) {
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }

  List<ProductModel> get favoriteProducts {
    return products.where((p) => p.isFavorite).toList();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}

class StoreScope extends InheritedNotifier<StoreNotifier> {
  const StoreScope({
    super.key,
    required StoreNotifier notifier,
    required super.child,
  }) : super(notifier: notifier);

  static StoreNotifier of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<StoreScope>();
    assert(scope != null, 'No StoreScope found in context');
    return scope!.notifier!;
  }
}
