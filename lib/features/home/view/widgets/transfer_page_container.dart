import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class TransferPageContainer extends StatelessWidget {
  const TransferPageContainer({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
    this.iconSize = 35,
  });
  final IconData iconData;
  final String title;
  final String subtitle;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: null,
        borderRadius: BorderRadius.circular(8),
        color: Palette.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          iconData,
          color: Palette.primaryColor,
          size: 35,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Palette.blackColor),
        ),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 14)),
        trailing: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Makes the container circular
            color: Colors.white, // Background color for the circle
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25), // Shadow color
                blurRadius: 4, // Smooth shadow edges
                spreadRadius: 2, // Spread of the shadow
                offset: const Offset(0, 4), // Shadow positioned below
              ),
            ],
          ),
          child: const Icon(Icons.keyboard_arrow_right,
              color: Palette.primaryColor),
        ),
      ),
    );
  }
}
