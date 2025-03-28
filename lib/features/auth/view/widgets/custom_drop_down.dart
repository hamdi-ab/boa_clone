import 'package:flutter/material.dart';

class ExpandableDropdown extends StatefulWidget {
  final Widget collapsedContent; // Content shown when dropdown is collapsed
  final Widget expandedContent; // Content shown when dropdown is expanded

  const ExpandableDropdown({
    required this.collapsedContent,
    required this.expandedContent,
    super.key,
  });

  @override
  _ExpandableDropdownState createState() => _ExpandableDropdownState();
}

class _ExpandableDropdownState extends State<ExpandableDropdown> {
  bool _isExpanded = false; // Tracks dropdown state

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown Header with Rotating Arrow
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Select an Option", style: TextStyle(fontSize: 18),),
                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0, // Rotates arrow
                  duration: Duration(milliseconds: 300),
                  child: Icon(Icons.keyboard_arrow_down, size: 28),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Swappable Content Section
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: _isExpanded ? widget.expandedContent : widget.collapsedContent,
        ),
      ],
    );
  }
}
