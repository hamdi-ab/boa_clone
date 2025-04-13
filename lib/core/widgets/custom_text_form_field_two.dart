import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldTwo extends StatelessWidget {
  const CustomTextFormFieldTwo({super.key, required this.hintText, this.prefix, this.onChanged});
  final String hintText;
  final Widget? prefix;
  final onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle( fontSize: 20 ,
          fontWeight: FontWeight.w600),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText, // Placeholder inside the field
        hintStyle: const TextStyle(
          fontSize: 20 ,
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
        contentPadding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 10.0, // Default padding
            ),
      ),

      keyboardType: TextInputType.phone, // Adjust keyboard for phone numbers
    );
  }
}
