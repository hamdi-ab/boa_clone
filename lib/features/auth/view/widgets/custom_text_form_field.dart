import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, required this.errorText, this.onChanged});
  final String hintText;
  final String? errorText;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0), // Dark underline for normal state
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0), // Dark underline for focused state
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0), // Dark underline for focused state
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0), // Dark underline for focused state
        ),
      ),
    );
  }
}
