import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_illustrations.dart';
import '../widgets/custom_button.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Vector illustration of shopping girl & oranges
              const WelcomeIllustrationWidget(),
              const SizedBox(height: 32),
              // Heading
              const Text(
                'Welcome to our app',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              // Subtitle
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Shop online and get groceries delivered from stores to your home in as fast as 1 hour .',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              // Sign up button
              CustomButton(
                text: 'Sign up',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SignUpScreen()),
                  );
                },
              ),
              const SizedBox(height: 14),
              // Sign in button
              CustomButton(
                text: 'Sign in',
                isOutlined: true,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SignInScreen()),
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
