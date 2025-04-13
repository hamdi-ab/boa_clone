import 'package:boa_clone/core/auth_state.dart';
import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/custom_text_form_field_two.dart';
import 'package:boa_clone/core/widgets/primary_color_button.dart';
import 'package:boa_clone/core/widgets/transparent_color_button.dart';
import 'package:boa_clone/features/auth/view/pages/exchange_rate_page.dart';
import 'package:boa_clone/features/auth/view/pages/locate_us.dart';
import 'package:boa_clone/features/auth/view/widgets/custom_drop_down.dart';
import 'package:boa_clone/features/auth/view/widgets/custom_radio_tile.dart';
import 'package:boa_clone/features/auth/view/widgets/scaffold_widget.dart';
import 'package:boa_clone/features/auth/viewmodel/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SignInViewModel>(context);

    return ScaffoldWidget(
      top: 0,
      bottom: 50,
      // Uses ViewModel's isExpanded state
      bottomNavigationBar: !vm.isExpanded ? _buildBottomNavBar(context) : null,
      children: [
        const SizedBox(height: 20),
        ExpandableDropdown(
          collapsedContent: const _CollapsedContent(),
          expandedContent: _buildExpandedContent(),
          onToggle: (_) => vm.toggleExpansion(),
          leftText: 'Welcome',
        ),
      ],
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavButton(Icons.location_on_outlined, "Locate Us", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LocateUs()));
          }),
          _buildNavButton(Icons.currency_exchange_outlined, "Exchange Rate",
              () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ExchangeRatePage()));
          }),
          _buildNavButton(
              Icons.qr_code_scanner_outlined, "Verify Receipt", () {}),
          _buildNavButton(Icons.phone_in_talk_outlined, "Support", () {}),
        ],
      ),
    );
  }

  Widget _buildNavButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: Icon(icon, size: 30), onPressed: onPressed),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildExpandedContent() {
    String? selectedOption = "Option 1";

    return StatefulBuilder(
      builder: (context, setState) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        key: const ValueKey("expanded"),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                TransparentColorButton(text: 'Update language', onTap: (){}),
                const SizedBox(height: 16),
                PrimaryColorButton(text: 'Cancel', onTap: (){}),
              ],
            ),
          )

        ],
      ),
    );
  }
}

class _CollapsedContent extends StatelessWidget {
  const _CollapsedContent();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SignInViewModel>(context);
    final authState = Provider.of<AuthState>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          CustomTextFormFieldTwo(
            hintText: "Enter Phone Number",
            prefix: _buildCountryCode(),
            onChanged: vm.setPhoneNumber,
          ),
          const SizedBox(height: 20.0),
          CustomTextFormFieldTwo(
            hintText: 'Enter PIN',
            prefix: null,
            onChanged: vm.setPin,
          ),
          const SizedBox(height: 50.0),
          TransparentColorButton(
            text: 'Login',
            onTap: (){
              if (vm.validateLogin()) {
                authState.login();
              } else {
                vm.errorMessage = 'Invalid credentials';
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCountryCode() {
    return Container(
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
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
