import 'package:flutter/material.dart';

class HomePageContainer extends StatelessWidget {
  const HomePageContainer({
    super.key,
    required this.text,
    required this.iconData, this.onTap,
  });
  final String text;
  final Widget iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              // Directly use the passed widget (iconData)
              SizedBox(
                height: 60,
                child: iconData, // Use the widget directly
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis, // Avoid overflow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
