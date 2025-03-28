import 'package:boa_clone/core/primary_color_button.dart';
import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/transparent_color_button.dart';
import 'package:boa_clone/features/auth/view/widgets/custom_drop_down.dart';
import 'package:boa_clone/features/auth/view/widgets/custom_radio_tile.dart';
import 'package:boa_clone/features/auth/view/widgets/custom_text_form_field_two.dart';
import 'package:boa_clone/features/auth/view/widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(top: 0, bottom: 50, children: [
      const SizedBox(
        height: 20,
      ),
      ExpandableDropdown(
        collapsedContent: const CollapsedContent(), // Default content
        expandedContent: _buildExpandedContent(), // Expanded dropdown content
      )
    ]);
  }
}

class CollapsedContent extends StatelessWidget {
  const CollapsedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        key: const ValueKey("collapsed"),
        children: [
          CustomTextFormFieldTwo(
            hintText: "Enter Phone Number",
            prefix: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              margin: const EdgeInsets.only(
                  right: 16.0), // Add spacing between box and input field
              decoration: BoxDecoration(
                  border: Border.all(color: Palette.greyColor, width: 1.0),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)) // Border for the box
                  ),
              child: const Text(
                '+251', // Prefix number
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500, // Text color
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          CustomTextFormFieldTwo(
            hintText: 'Enter PIN',
            prefix: null,
          ),
          const SizedBox(height: 50.0,),
          TransparentColorButton(text: 'Login', onTap: (){})
        ],
      ),
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
            TransparentColorButton(text: 'Update language', onTap: () {}),
            SizedBox(width: 10),
            PrimaryColorButton(text: 'Cancel', onTap: () {}),
          ],
        )
      ],
    ),
  );
}
