import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class TransparentColorButton extends StatelessWidget {
  const TransparentColorButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          side: const BorderSide(color: Palette.greyColor, width: 1.0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Set the border radius
            ),
            backgroundColor: Palette.lightGrey,
            fixedSize: const Size(345, 60)),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,),
        ));
  }
}
