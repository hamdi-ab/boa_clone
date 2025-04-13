import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/primary_color_button.dart';
import 'package:boa_clone/features/home/view/pages/home_page.dart';
import 'package:boa_clone/features/home/view/pages/transfers_page.dart';
import 'package:flutter/material.dart';

class TransactionReceipt extends StatelessWidget {
  final String bankName;
  final String accountNumber;
  final String amount;

  const TransactionReceipt({
    super.key,
    required this.bankName,
    required this.accountNumber,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 29.0),
              child: Text(
                'Acknowledgment',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  // Main content container
                  Container(
                    margin: const EdgeInsets.only(top: 35),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Palette.whiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(26.0),
                      ),
                    ),
                    child: SingleChildScrollView( // Moved scroll here
                      physics: const BouncingScrollPhysics(),
                      child: _buildReceiptCard(context),
                    ),
                  ),
                  // Checkmark icon
                  const Positioned(
                    child: CircleAvatar(
                      backgroundColor: Palette.whiteColor,
                      radius: 35,
                      child: Icon(
                        Icons.check_circle,
                        size: 70,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Successful',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildDetailRow('Source Account', '91234567'),
          _buildDetailRow('Source Account Name', 'SALMAN ALI ABDURAHMAN'),
          _buildDetailRow('Amount', 'ETB $amount'),
          _buildDetailRow('Transaction Type', 'EthSwitch'),
          _buildDetailRow('Receiver\'s Account', accountNumber),
          _buildDetailRow('Receiver\'s Name', 'SELMAN ALI ABDURHMAN'),
          _buildDetailRow('Transaction Date', '02/04/2025, 22:19:36'),
          _buildDetailRow('Transaction Reference', 'FT2509362QNG'),
          _buildDetailRow('Bank Name', bankName),
          _buildDetailRow('Note', ''),
          const SizedBox(height: 16),
          _buildActionButtons(context),
          const SizedBox(height: 50), // Safe space at bottom
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis, // Prevent overflow
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.right,
              maxLines: 2, // Allow the text to break into two lines
              overflow: TextOverflow.ellipsis, // Prevent overflow
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            border: null,
            borderRadius: BorderRadius.circular(8),
            color: Palette.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                (Icons.download),
                size: 30,
                color: Palette.primaryColor,
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Screenshot',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        PrimaryColorButton(
          text: 'Back To Home',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

          },
        ),
        const SizedBox(height: 16),
        PrimaryColorButton(
          text: 'New Transfer',
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => TransfersPage()),
                  (Route<dynamic> route) => route.isFirst, // Keep the first route (home page)
            );
          },
        ),
      ],
    );
  }

}
