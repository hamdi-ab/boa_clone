import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/custom_scaffold.dart';
import 'package:boa_clone/core/widgets/primary_color_button.dart';
import 'package:boa_clone/features/home/view/pages/transaction_receipt.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage(
      {super.key,
      required this.bankName,
      required this.accountNumber,
      required this.amount});
  final String bankName;
  final String accountNumber;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Review',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const ReviewContainer(
                      leftText: 'From',
                      rightText: 'SALM...91234567',
                    ),
                    ReviewContainer(
                        leftText: 'Receiver Account', rightText: accountNumber),
                    const ReviewContainer(
                        leftText: 'Receiver Name',
                        rightText: 'SELMAN ALI ABDURAHMAN'),
                    ReviewContainer(
                        leftText: 'Amount', rightText: 'ETB $amount'),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text('Note',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Palette.blackColor,
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      maxLines: 5, // Allows the TextField to be 4 lines long
                      decoration: InputDecoration(
                        hintText: 'Note',
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Palette.greyColor, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Palette.greyColor, width: 1.0),
                            borderRadius:
                                BorderRadius.circular(8.0) // Focused state
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PrimaryColorButton(
                        text: 'Review and Pay',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TransactionReceipt(
                                        amount: amount,
                                        accountNumber: accountNumber,
                                        bankName: bankName,
                                      )));
                        })
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

class ReviewContainer extends StatelessWidget {
  const ReviewContainer({
    super.key,
    required this.leftText,
    required this.rightText,
  });
  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Adjust horizontal spacing
        children: [
          Flexible(
            child: Text(
              leftText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis, // Prevent overflow
            ),
          ),
          Flexible(
            child: Text(
              rightText,
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
}
