import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/custom_scaffold.dart';
import 'package:boa_clone/features/home/view/widgets/transaction_container.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Transaction',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 240, // Set the desired width here
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Transactions",
                    hintStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[
                            300]!, // Border color when the TextField is focused
                        width: 2, // Border width
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.grey[
                            300]!, // Border color when the TextField is focused
                        width: 2, // Border width
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 45, // Circular diameter
                height: 45, // Circular diameter
                decoration: BoxDecoration(
                  color: Colors.transparent, // Transparent background
                  shape: BoxShape.circle, // Circular shape
                  border: Border.all(
                    color: Palette.primaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: const Icon(
                  Icons.autorenew, // Recycle icon
                  color: Palette.primaryColor, // Icon color
                  size: 30, // Icon size
                ),
              ),
              const Icon(
                Icons.tune,
                color: Palette.primaryColor,
                size: 45,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const TransactionContainer(
            transaction_Type: 'Eth-Switch P2P Outgoing',
            amount: 3021.70,
            date: '11/02/2025',
            isIncome: false,
          ),
          const TransactionContainer(
            transaction_Type: 'Salary Payment',
            amount: 5200.00,
            date: '05/02/2025',
            isIncome: true,
          ),
          const TransactionContainer(
            transaction_Type: 'Grocery Shopping',
            amount: 1023.45,
            date: '07/02/2025',
            isIncome: false,
          ),
          const TransactionContainer(
            transaction_Type: 'Freelance Work Payment',
            amount: 750.00,
            date: '08/02/2025',
            isIncome: true,
          ),
          const TransactionContainer(
            transaction_Type: 'Utility Bill Payment',
            amount: 489.99,
            date: '09/02/2025',
            isIncome: false,
          ),
          const TransactionContainer(
            transaction_Type: 'Dividends Earned',
            amount: 305.75,
            date: '10/02/2025',
            isIncome: true,
          ),
          const TransactionContainer(
            transaction_Type: 'Online Purchase - Electronics',
            amount: 2000.00,
            date: '12/02/2025',
            isIncome: false,
          ),
        ],
      ),
    );
  }
}
