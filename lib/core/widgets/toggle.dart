import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
  final List<String>
  labels; // List of toggle labels (e.g., ["Cash", "Transactions"])
  final int selectedIndex; // Currently selected index
  final Function(int) onToggle;
  final  double height;
  final double fontSize;
  final double borderRadius;// Callback when toggle is clicked

  const Toggle({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onToggle, required this.height, required this.fontSize, required this.borderRadius,
  });

  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300, // Background color
        borderRadius: BorderRadius.circular(widget.borderRadius), // Rounded edges
      ),
      child: Row(
        children: List.generate(
          widget.labels.length,
              (index) {
            final isSelected =
                index == widget.selectedIndex; // Check if button is selected
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget
                        .onToggle(index); // Update index when button is clicked
                  });
                },
                child: Container(
                  height: widget.height, // Increased button height
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Palette.primaryColor
                        : Palette.transparentColor, // Highlight selected button
                    borderRadius:
                    BorderRadius.circular(12), // Rounded edges for buttons
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.labels[index],
                    style:  TextStyle(
                      fontSize: widget.fontSize,
                      color: Palette
                          .blackColor, // Change text color based on selection
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}