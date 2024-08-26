import 'package:flutter/material.dart';
import 'package:technical_test_fast8/app/constant/colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isOutlined;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.isOutlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined ? Colors.white : backgroundColor ?? AppColors.primary,
        foregroundColor: textColor ?? (isOutlined ? AppColors.primary : Colors.white),
        side: isOutlined ? const BorderSide(color: AppColors.primary, width: 2) : BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: isOutlined ? 0 : 2,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: isOutlined ? AppColors.primary : textColor ?? Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
