import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class HomePageContainer extends StatelessWidget {
  const HomePageContainer({super.key, required this.text, required this.iconData});
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 130,
      width: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Palette.primaryColor,
              size: 60,
            ),
            Text(
              text, // Text that wraps to the next line
              textAlign: TextAlign.center, // Center the text horizontally
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              maxLines: 2, // Set the maximum number of lines to wrap
              softWrap: true, // Enable text wrapping
              overflow: TextOverflow.visible, // Allows text overflow to wrap properly
            ),
          ],
        ),
      ),
    );
  }
}
