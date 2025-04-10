import 'package:boa_clone/core/widgets/primary_color_button.dart';
import 'package:boa_clone/core/widgets/transparent_color_button.dart';
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
  bool _isExpanded = false;
  String selectedValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(top: 35, bottom: 110, children: [
      const SizedBox(height: 20,),
      ExpandableDropdown(
        collapsedContent: const CollapsedContent(), // Default content
        expandedContent: _buildExpandedContent(),
        onToggle:  (bool isExpanded) {
          setState(() {
            _isExpanded = isExpanded;
          });
        },// Expanded dropdown content
      )
    ]);
  }
}

class CollapsedContent extends StatelessWidget {
  const CollapsedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey("collapsed"),
      children: [
        const SizedBox(height: 80,),
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
              countryCode: 'us', // Replace with actual flag icons
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
              countryCode: 'et', // Replace with actual flag icons
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
              countryCode: 'et', // Replace with actual flag icons
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
              countryCode: 'et', // Replace with actual flag icons
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
              countryCode: 'et', // Replace with actual flag icons
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
            SizedBox(height: 30,),
            TransparentColorButton(text: 'Update language', onTap: (){}),
            const SizedBox(height: 16),
            PrimaryColorButton(text: 'Cancel', onTap: (){}),
          ],
        )

      ],
    ),
  );
}

