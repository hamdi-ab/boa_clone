import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class TransferPageContainer extends StatelessWidget {
  const TransferPageContainer({
    super.key,
    required this.iconWidget, // Accepts any widget (Icon or Image)
    required this.title,
    required this.subtitle, this.onTap,
  });

  final Widget iconWidget; // Changed from IconData to Widget
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
          leading: SizedBox(
            width: 35, // Set width for consistency
            height: 35, // Set height for consistency
            child: iconWidget, // Render the dynamic widget (Icon or Image)
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Palette.blackColor,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 14),
          ),
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
            child: const Icon(
              Icons.keyboard_arrow_right,
              color: Palette.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
