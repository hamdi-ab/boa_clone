import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/features/auth/view/widgets/exchange_rate_tile.dart';
import 'package:boa_clone/core/widgets/toggle.dart';
import 'package:flutter/material.dart';

class ExchangeRatePage extends StatefulWidget {
  const ExchangeRatePage({super.key});

  @override
  State<ExchangeRatePage> createState() => _ExchangeRatePageState();
}

class _ExchangeRatePageState extends State<ExchangeRatePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exchange Rate',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Palette.primaryColor,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ))
        ],
      ),
      backgroundColor: Palette.primaryColor,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Palette.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26.0),
            topRight: Radius.circular(26.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Toggle(
                height: 55,
                fontSize: 20,
                labels: const ["Cash", "Transactions"], // Toggle labels
                selectedIndex: selectedIndex, // Pass the current selected index
                onToggle: (newIndex) {
                  setState(() {
                    selectedIndex = newIndex; // Update selection when toggled
                  });
                },
              ),
              const SizedBox(height: 20,),
              const Text('March 30, 2025',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Currency',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Text('Buying',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Text('Selling',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 30,),
              const Column(
                children: const [
                  ExchangeRateTile(
                    countryCode: 'us', // United States
                    title: 'USD',
                    buying: '128.4294',
                    selling: '130.998',
                  ),
                  ExchangeRateTile(
                    countryCode: 'gb', // United Kingdom
                    title: 'GBP',
                    buying: '150.3276',
                    selling: '152.8742',
                  ),
                  ExchangeRateTile(
                    countryCode: 'ch', // Switzerland
                    title: 'CHF',
                    buying: '139.5231',
                    selling: '141.6704',
                  ),
                  ExchangeRateTile(
                    countryCode: 'tr', // Turkey
                    title: 'TUR',
                    buying: '7.9084',
                    selling: '8.1037',
                  ),
                  ExchangeRateTile(
                    countryCode: 'ae', // United Arab Emirates
                    title: 'AED',
                    buying: '35.0298',
                    selling: '35.6741',
                  ),
                ],
              )

              ,


            ],
          ),
        ),
      ),
    );
  }
}


