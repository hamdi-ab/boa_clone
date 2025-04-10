import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';// Adjust path

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Palette.primaryColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Default cancel behavior
            },
            child: const Text(
              'Cancel',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Palette.blackColor),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Palette.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26.0),
            topRight: Radius.circular(26.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: child,
        ),
      ),
    );
  }
}
