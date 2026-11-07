import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_illustrations.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'sign_in_screen.dart';
import 'main_nav_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primary, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Sign Up',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Illustration
              const Center(
                child: AuthIllustrationWidget(isSignIn: false),
              ),
              const SizedBox(height: 20),
              // Instructions
              const Text(
                'Please enter your information to create an account.',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 15,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              // Input Fields
              const CustomTextField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),
              const CustomTextField(
                hintText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 14),
              const CustomTextField(
                hintText: 'Confirm Password',
                isPassword: true,
              ),
              const SizedBox(height: 28),
              // Sign up button
              CustomButton(
                text: 'Sign up',
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const MainNavScreen()),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 20),
              // Footer link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const SignInScreen()),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
