import 'package:boa_clone/core/primary_color_button.dart';
import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/transparent_color_button.dart';
import 'package:boa_clone/features/auth/view/pages/exchange_rate_page.dart';
import 'package:boa_clone/features/auth/view/pages/locate_us.dart';
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
  bool _isExpanded = false; // Tracks dropdown state

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      top: 0,
      bottom: 50,
      bottomNavigationBar: !_isExpanded
          ? Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Location Button with Label
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.location_on_outlined, size: 30),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LocateUs()));
                  },
                ),
                const Text(
                  "Locate Us",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),

            // Currency Exchange Button with Label
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.currency_exchange_outlined, size: 30),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ExchangeRatePage()));
                  },
                ),
                const Text(
                  "Exchange Rate",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),

            // QR Code Button with Label
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.qr_code_scanner_outlined, size: 30),
                  onPressed: () {
                    // QR Code button action
                  },
                ),
                const Text(
                  "Verify Receipt",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),

            // Phone Call Button with Label
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.phone_in_talk_outlined, size: 30),
                  onPressed: () {
                    // Phone Call button action
                  },
                ),
                const Text(
                  "Support",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      )
          : null, // No navigation bar when expanded
      children: [
        const SizedBox(height: 20),
        ExpandableDropdown(
          collapsedContent: const CollapsedContent(),
          expandedContent: _buildExpandedContent(),
          onToggle: (bool isExpanded) {
            setState(() {
              _isExpanded = isExpanded;
            });
          },
          leftText: 'Welcome',
        ),
      ], // No navigation bar when expanded
    );
  }
}

class CollapsedContent extends StatelessWidget {
  const CollapsedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Main content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              CustomTextFormFieldTwo(
                hintText: "Enter Phone Number",
                prefix: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                  margin: const EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Palette.greyColor, width: 1.0),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: const Text(
                    '+251',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const CustomTextFormFieldTwo(
                hintText: 'Enter PIN',
                prefix: null,
              ),
              const SizedBox(height: 50.0),
              TransparentColorButton(
                text: 'Login',
                onTap: () {
                  // Handle login action
                },
              ),
            ],
          ),
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
            SizedBox(height: 130,),
            TransparentColorButton(text: 'Update language', onTap: () {}),
            SizedBox(height: 16,),
            PrimaryColorButton(text: 'Cancel', onTap: () {}),
          ],
        )
      ],
    ),
  );
}
