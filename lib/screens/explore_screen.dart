import 'package:flutter/material.dart';
import '../providers/store_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/category_item.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = StoreScope.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Categories',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              // Search Input Bar
              Container(
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: (val) => store.setSearchQuery(val),
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 15,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: AppColors.textSecondary,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Categories Grid
              Expanded(
                child: Builder(
                  builder: (context) {
                    final filteredCategories = store.categories.where((cat) {
                      return cat.name.toLowerCase().contains(store.searchQuery.toLowerCase());
                    }).toList();

                    return GridView.builder(
                      itemCount: filteredCategories.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.85,
                      ),
                      itemBuilder: (context, index) {
                        final category = filteredCategories[index];
                        return CategoryItem(
                          category: category,
                          size: 78,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Showing ${category.name} products'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
