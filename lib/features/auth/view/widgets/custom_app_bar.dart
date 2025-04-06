import 'package:flutter/material.dart';

class CustomCurvedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(60.0);

  final String title;
  final List<Widget>? actions;

  const CustomCurvedAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _AppBarClipper(),
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (actions != null) ...actions!,
          ],
        ),
      ),
    );
  }
}

class _AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final height = size.height;
    final width = size.width;

    path.lineTo(0, height - 20);
    path.quadraticBezierTo(30, height + 20, 60, height);
    path.lineTo(width - 60, height);
    path.quadraticBezierTo(width - 30, height + 20, width, height - 20);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}