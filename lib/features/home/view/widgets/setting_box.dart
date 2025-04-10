import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class SettingBox extends StatelessWidget {
  const SettingBox({super.key, required this.title});
  final String title;
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
          leading: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
        ));
  }
}
