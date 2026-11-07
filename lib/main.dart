import 'package:flutter/material.dart';
import 'providers/store_provider.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const RetailStoreApp());
}

class RetailStoreApp extends StatefulWidget {
  const RetailStoreApp({super.key});

  @override
  State<RetailStoreApp> createState() => _RetailStoreAppState();
}

class _RetailStoreAppState extends State<RetailStoreApp> {
  late final StoreNotifier _storeNotifier;

  @override
  void initState() {
    super.initState();
    _storeNotifier = StoreNotifier();
  }

  @override
  void dispose() {
    _storeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreScope(
      notifier: _storeNotifier,
      child: MaterialApp(
        title: 'Retail Store',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
