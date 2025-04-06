import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class CustomRadioTile extends StatelessWidget {
  const CustomRadioTile({super.key, required this.title, required this.countryCode, required this.value, this.groupValue, required this.onChanged});
  final String title;
  final String countryCode;// Flag icon
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 17 ),
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Palette.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.5,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading:   CountryFlag.fromCountryCode(
          countryCode.toUpperCase(), // Ensure the country code is uppercase
          shape: const Rectangle(), // Circular flag shape
          height: 30,            // Flag height
          width: 50,
        ),// Flag Icon
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Transform.scale(
          scale: value == groupValue ? 1.4 : 1.2,
          child: Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: Palette.primaryColor,
            fillColor: WidgetStateProperty.all(Palette.primaryColor),
          ),
        ),
        onTap: () => onChanged(value), // Makes the whole tile tappable
        // Makes the whole tile tappable
      ),
    );
  }
}
