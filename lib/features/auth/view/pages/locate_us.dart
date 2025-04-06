import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class LocateUs extends StatelessWidget {
  const LocateUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Locate Us',
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(
                16.0), // Adds spacing around the search bar
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(fontSize: 16),
                filled: true,
                fillColor: Colors.white, // Background color of the search bar
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  borderSide: BorderSide.none, // No border line
                ),
                prefixIcon:
                    const Icon(Icons.search, color: Colors.grey), // Search icon
              ),
            ),
          ),
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Palette.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26.0),
                  topRight: Radius.circular(26.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('hi')),
                  Row(

                  )
                ],
              ))
        ]));
  }
}
