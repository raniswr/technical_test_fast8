import 'package:flutter/material.dart';
import 'package:technical_test_fast8/app/constant/colors.dart';

// Define a custom reusable DropdownButtonFormField widget
class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?>? onChanged;

  // Constructor with parameters
  CustomDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        value: value,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
