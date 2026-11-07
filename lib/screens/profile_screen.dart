import 'package:flutter/material.dart';
import '../providers/store_provider.dart';
import '../theme/app_theme.dart';
import 'orders_screen.dart';
import 'welcome_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = StoreScope.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Menu Options
              _buildMenuItem(
                icon: Icons.person_outline_rounded,
                title: 'Edit Profile',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Edit Profile clicked')),
                  );
                },
              ),
              _buildMenuItem(
                icon: Icons.key_outlined,
                title: 'Change Password',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Change Password clicked')),
                  );
                },
              ),
              _buildMenuItem(
                icon: Icons.credit_card_outlined,
                title: 'My Cards',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('My Cards clicked')),
                  );
                },
              ),
              _buildMenuItem(
                icon: Icons.shopping_bag_outlined,
                title: 'My Orders',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const OrdersScreen()),
                  );
                },
              ),

              const SizedBox(height: 28),

              // App Settings Subheader
              const Text(
                'App Settings',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),

              // Notifications Toggle Switch
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.notifications_none_rounded,
                      color: AppColors.textDark,
                      size: 24,
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                    Switch(
                      value: store.notificationsEnabled,
                      activeColor: AppColors.primary,
                      onChanged: (val) => store.toggleNotifications(val),
                    ),
                  ],
                ),
              ),

              // Language Selector
              _buildMenuItem(
                icon: Icons.g_translate_outlined,
                title: 'Language',
                trailingText: store.selectedLanguage,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (ctx) => Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: const Text('English'),
                            trailing: store.selectedLanguage == 'English'
                                ? const Icon(Icons.check, color: AppColors.primary)
                                : null,
                            onTap: () {
                              store.setLanguage('English');
                              Navigator.pop(ctx);
                            },
                          ),
                          ListTile(
                            title: const Text('العربية (Arabic)'),
                            trailing: store.selectedLanguage == 'العربية'
                                ? const Icon(Icons.check, color: AppColors.primary)
                                : null,
                            onTap: () {
                              store.setLanguage('العربية');
                              Navigator.pop(ctx);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              // Logout
              _buildMenuItem(
                icon: Icons.logout_rounded,
                title: 'Logout',
                showArrow: false,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(ctx);
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(color: AppColors.red),
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
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? trailingText,
    bool showArrow = true,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.textDark,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
            ),
            if (trailingText != null) ...[
              Text(
                trailingText,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 6),
            ],
            if (showArrow)
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.textDark,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
}
