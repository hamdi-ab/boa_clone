import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class TransactionContainer extends StatelessWidget {
  const TransactionContainer(
      {super.key,
      required this.transaction_Type,
      required this.date,
      required this.amount,
      required this.isIncome});
  final String transaction_Type;
  final String date;
  final double amount;
  final bool isIncome;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: null,
          borderRadius: BorderRadius.circular(6),
          color: Palette.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.35),
              spreadRadius: 4,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transaction_Type, // Top-left text
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow:
                      TextOverflow.ellipsis, // Adds "..." if the text overflows
                  maxLines: 1,
                ),
                Text(
                  "${isIncome ? '' : '-'} ${amount.toStringAsFixed(2)}", // Top-right text
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isIncome ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8), // Space between the rows
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date, // Bottom-left text
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  "ETB", // Bottom-right text
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ]));
  }
}
