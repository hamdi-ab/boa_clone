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
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // Transaction Type Filter
                    _buildSectionTitle("Transaction Type"),
                    const SizedBox(height: 16),
                    _buildToggleButtons(),
                    // Category Filter
                    _buildCategoryRadioButtons(),
                    // Time Range Filter
                    _buildTimeRangeSection(),
                    const SizedBox(height: 20),

                    // Amount Filter
                    _buildAmountSection(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Fixed bottom button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PrimaryColorButton(text: 'Search', onTap: () {}),
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Text(
    title,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  );

  Widget _buildToggleButtons() => Row(
    children: [
      Expanded(
        child: Toggle(
          borderRadius: 10,
          fontSize: 16,
          height: 40,
          labels: const ['All', 'Credit', 'Debit'],
          selectedIndex: selectedIndex,
          onToggle: (newIndex) => setState(() => selectedIndex = newIndex),
        ),
      ),
    ],
  );

  Widget _buildCategoryRadioButtons() => Column(
    children: [
      _buildRadioRow("Transfer", selectedCategory),
      _buildRadioRow("Utilities", selectedCategory),
      _buildRadioRow("Scheduled", selectedCategory),
    ],
  );

  Widget _buildRadioRow(String value, String? groupValue) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        value,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      Transform.scale(
        scale: 1.5,
        child: Radio<String>(
          value: value,
          groupValue: groupValue,
          activeColor: Palette.primaryColor,
          onChanged: (v) => setState(() => selectedCategory = v!),
        ),
      ),
    ],
  );

  Widget _buildTimeRangeSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildSectionTitle("Time Range"),
      const SizedBox(height: 16),
      Row(
        children: [
          Expanded(
            child: CustomDatePicker(
              label: "Start Date",
              selectedDate: startDate,
              onDateSelected: (date) => setState(() => startDate = date),
            ),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.arrow_forward, size: 30, color: Colors.grey),
          const SizedBox(width: 16),
          Expanded(
            child: CustomDatePicker(
              label: "End Date",
              selectedDate: endDate,
              onDateSelected: (date) => setState(() => endDate = date),
            ),
          ),
        ],
      ),
    ],
  );

  Widget _buildAmountSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildSectionTitle("Amount"),
      const SizedBox(height: 16),
      _buildAmountRadioRow(),
      const SizedBox(height: 16),
      _buildRangeRadioRow(),
    ],
  );

  Widget _buildAmountRadioRow() => Row(
    children: [
      _buildRadioButton("Amount", selectedAmount),
      const SizedBox(width: 8),
      const Text("Amount", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(width: 16),
      const Expanded(child: CustomField()),
    ],
  );

  Widget _buildRangeRadioRow() => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildRadioButton("Range", selectedAmount),
      const SizedBox(width: 8),
      const Padding(
        padding: EdgeInsets.only(top: 6.0),
        child: Text("Range", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      const SizedBox(width: 30),
      const Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Min Amount", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            CustomField(),
            SizedBox(height: 16),
            Text("Max Amount", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            CustomField(),
          ],
        ),
      ),
    ],
  );

  Widget _buildRadioButton(String value, String? groupValue) => Transform.scale(
    scale: 1.5,
    child: Radio<String>(
      value: value,
      groupValue: groupValue,
      activeColor: Palette.primaryColor,
      onChanged: (v) => setState(() => selectedAmount = v!),
    ),
  );
}

class CustomField extends StatelessWidget {
  const CustomField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldTwo(
      hintText: "0.00",
      prefix: Container(
        height: 30,
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
    );
  }
}

