import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class ExchangeRateTile extends StatelessWidget {
  const ExchangeRateTile({super.key,required this.title, required this.buying, required this.selling, required this.countryCode});
  final String countryCode;
  final String title;
  final String buying;
  final String selling;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 4),
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
        leading: CountryFlag.fromCountryCode(
            countryCode.toUpperCase(), // Ensure the country code is uppercase
            shape: const Circle(), // Circular flag shape
            height: 50,            // Flag height
            width: 50,
        ),
        title:  Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Text(buying,  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Text(selling,  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
