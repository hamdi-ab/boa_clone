import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldTwo extends StatelessWidget {
  const CustomTextFormFieldTwo({super.key, required this.hintText, this.prefix});
  final String hintText;
  final Widget? prefix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText, // Placeholder inside the field
        hintStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.greyColor, width: 1.0),
            borderRadius: BorderRadius.circular(8.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.greyColor, width: 1.0),
            borderRadius: BorderRadius.circular(8.0) // Focused state
            ),
        // Add a rectangular box as a prefix
        prefixIcon: prefix,
      ),
      keyboardType: TextInputType.phone, // Adjust keyboard for phone numbers
    );
  }
}
