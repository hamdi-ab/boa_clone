import 'package:flutter/material.dart';

class ExpandableDropdown extends StatefulWidget {
  final Widget collapsedContent; // Content shown when dropdown is collapsed
  final Widget expandedContent; // Content shown when dropdown is expanded
  final ValueChanged<bool> onToggle; // Callback for state changes
  final String? leftText; // Optional left-aligned text

  const ExpandableDropdown({
    required this.collapsedContent,
    required this.expandedContent,
    required this.onToggle,
    this.leftText, // Add optional left-aligned text
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
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
              widget.onToggle(_isExpanded); // Notify parent about state change
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: widget.leftText != null
                  ? MainAxisAlignment.spaceBetween // Space text and dropdown
                  : MainAxisAlignment.end, // Align dropdown to the right if no leftText
              children: [
                // Render left-aligned text if provided
                if (widget.leftText != null)
                  Text(
                    widget.leftText!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                Row(
                  children: [
                    const Text(
                      "English",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.keyboard_arrow_down, size: 28),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child: _isExpanded ? widget.expandedContent : widget.collapsedContent,
        ),
      ],
    );
  }
}
