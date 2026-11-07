import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final String? labelText;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.labelText,
  });
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: const TextStyle(
              color: AppColors.textDark,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
        ],
        Container(
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscureText : false,
            keyboardType: widget.keyboardType,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textDark,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
