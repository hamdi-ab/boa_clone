import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class PrimaryColorButton extends StatelessWidget {
  const PrimaryColorButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Set the border radius
            ),
            backgroundColor: Palette.primaryColor,
            fixedSize: const Size(335, 55)),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Palette.blackColor),
        ));
  }
}
