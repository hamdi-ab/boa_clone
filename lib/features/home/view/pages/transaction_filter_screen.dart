import 'package:boa_clone/core/widgets/custom_scaffold.dart';
import 'package:boa_clone/core/widgets/custom_text_form_field_two.dart';
import 'package:boa_clone/core/widgets/primary_color_button.dart';
import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/toggle.dart';
import 'package:boa_clone/features/home/view/widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';

class TransactionFilterScreen extends StatefulWidget {
  const TransactionFilterScreen({super.key});

  @override
  _TransactionFilterScreenState createState() =>
      _TransactionFilterScreenState();
}

class _TransactionFilterScreenState extends State<TransactionFilterScreen> {
  String? transactionType; // Default transaction type
  DateTime? startDate;
  DateTime? endDate;
  int selectedIndex = 0;
  String? selectedCategory;
  String? selectedAmount;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Transfers',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          // Transaction Type Filter
          const Text("Transaction Type",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 16,),
          Row(
            children: [
              Expanded(
                child: Toggle(
                  fontSize: 16,
                  height: 40,
                  labels: const ['All', 'Credit', 'Debit'],
                  selectedIndex: selectedIndex,
                  onToggle: (newIndex) {
                    setState(() {
                      selectedIndex = newIndex; // Update selection when toggled
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Transfer",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Transform.scale(
                      scale:
                          1.5, // Adjust the scale to make the radio button larger
                      child: Radio<String>(
                        value: "Transfer",
                        groupValue: selectedCategory,
                        activeColor: Palette.primaryColor,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Utilities",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Transform.scale(
                      scale: 1.5, // Adjust the scale for the radio button
                      child: Radio<String>(
                        value: "Utilities",
                        groupValue: selectedCategory,
                        activeColor: Palette.primaryColor,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Scheduled",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Transform.scale(
                      scale: 1.5, // Adjust the scale for the radio button
                      child: Radio<String>(
                        value: "Scheduled",
                        groupValue: selectedCategory,
                        activeColor: Palette.primaryColor,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Time Range Filter
          const Text("Time Range", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 16,),
          Row(
            children: [
              Expanded(
                child: CustomDatePicker(
                  label: "Start Date",
                  selectedDate: startDate,
                  onDateSelected: (date) {
                    setState(() {
                      startDate = date;
                    });
                  },
                ),
              ),
              const SizedBox(width: 20),
              const Icon(
                Icons.arrow_forward, // Right-pointing arrow
                size: 50.0, // Makes the arrow big
                color: Colors.grey, // Adjust color if needed
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomDatePicker(
                  label: "End Date",
                  selectedDate: endDate,
                  onDateSelected: (date) {
                    setState(() {
                      endDate = date;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text("Amount", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 1.5, // Adjust the scale for the radio button
                child: Radio<String>(
                  value: "Amount",
                  groupValue: selectedAmount,
                  activeColor: Palette.primaryColor,
                  onChanged: (value) {
                    setState(() {
                      selectedAmount = value!;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8), // Space between radio and text
              const Text(
                "Amount",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16), // Space between text and text field
              Expanded(
                child: CustomTextFormFieldTwo(
                  hintText: "0.00",
                  prefix: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10.0),
                    margin: const EdgeInsets.only(right: 16.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                            color: Palette.greyColor,
                            width: 1.0), // Only right side border
                      ),
                    ),
                    child: const Text(
                      'ETB',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // Space between rows

          // Second Row: Radio, Column with Custom Text Fields and Title
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align items from the top
            children: [
              Transform.scale(
                scale: 1.5, // Adjust the scale for the radio button
                child: Radio<String>(
                  value: "Range",
                  groupValue: selectedAmount,
                  activeColor: Palette.primaryColor,
                  onChanged: (value) {
                    setState(() {
                      selectedAmount = value!;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8), // Space between radio and text
              const Padding(
                padding: EdgeInsets.only(top: 6.0), // Adjust vertical alignment
                child: Text(
                  "Range",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16), // Space between text and column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Min Amount",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                        height: 8), // Space between title and text field
                    CustomTextFormFieldTwo(
                      hintText: "0.00",
                      prefix: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10.0),
                        margin: const EdgeInsets.only(right: 16.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Palette.greyColor,
                              width: 1.0, // Only right side border
                            ),
                          ),
                        ),
                        child: const Text(
                          'ETB',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8), // Space between text fields
                    const Text(
                      "Max Amount",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomTextFormFieldTwo(
                      hintText: "0.00",
                      prefix: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10.0),
                        margin: const EdgeInsets.only(right: 16.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Palette.greyColor,
                              width: 1.0, // Only right side border
                            ),
                          ),
                        ),
                        child: const Text(
                          'ETB',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          PrimaryColorButton(text: 'Search', onTap: () {})
        ],
      ),
    );
  }
}
