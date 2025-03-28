import 'package:boa_clone/core/primary_color_button.dart';
import 'package:boa_clone/core/transparent_color_button.dart';
import 'package:boa_clone/features/auth/view/pages/activate_page.dart';
import 'package:boa_clone/features/auth/view/pages/sign_in_page.dart';
import 'package:boa_clone/features/auth/view/widgets/custom_drop_down.dart';
import 'package:boa_clone/features/auth/view/widgets/custom_radio_tile.dart';
import 'package:boa_clone/features/auth/view/widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isDropdownExpanded = false; // Tracks dropdown expansion state
  String selectedValue = 'Option 1'; // Tracks selected dropdown value

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(children: [
      SizedBox(height: 20,),
      ExpandableDropdown(
        collapsedContent: CollapsedContent(), // Default content
        expandedContent: _buildExpandedContent(), // Expanded dropdown content
      )
    ], top: 35, bottom: 110);
  }
}

class CollapsedContent extends StatelessWidget {
  const CollapsedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey("collapsed"),
      children: [
        SizedBox(height: 80,),
        const Text(
          'Welcome to Bank of Abyssinia Mobile',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Banking Application',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 170),
        PrimaryColorButton(
          text: 'Activate',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ActivatePage()),
            );
          },
        ),
        const SizedBox(height: 20),
        PrimaryColorButton(
          text: 'Sign In',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInPage()),
            );
          },
        ),
      ],
    );
  }
}





Widget _buildExpandedContent() {
  String? selectedOption = "Option 1";

  return StatefulBuilder(
    builder: (context, setState) => Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      key: ValueKey("expanded"),
      children: [
        Column(
          children: [
            CustomRadioTile(
              title: "English",
              flagIcon: Icons.flag_circle, // Replace with actual flag icons
              value: "Option 1",
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            CustomRadioTile(
              title: "አማርኛ",
              flagIcon: Icons.flag_circle, // Replace with actual flag icons
              value: "Option 2",
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            CustomRadioTile(
              title: "ትግርኛ",
              flagIcon: Icons.flag_circle, // Replace with actual flag icons
              value: "Option 3",
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            CustomRadioTile(
              title: "Afaan Oromoo",
              flagIcon: Icons.flag_circle, // Replace with actual flag icons
              value: "Option 4",
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            CustomRadioTile(
              title: "Af Somali",
              flagIcon: Icons.flag_circle, // Replace with actual flag icons
              value: "Option 5",
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
          ],
        ),
        Column(
          children: [
            TransparentColorButton(text: 'Update language', onTap: (){}),
            SizedBox(width: 10),
            PrimaryColorButton(text: 'Cancel', onTap: (){}),
          ],
        )

      ],
    ),
  );
}

