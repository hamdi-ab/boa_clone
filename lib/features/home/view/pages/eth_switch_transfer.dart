import 'package:boa_clone/core/assets/consts.dart';
import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/transparent_color_button.dart';
import 'package:boa_clone/features/home/view/pages/amount_selection_page.dart';
import 'package:boa_clone/features/home/view/pages/select_bank_page.dart';
import 'package:flutter/material.dart';

class EthSwitchTransfer extends StatefulWidget {
  const EthSwitchTransfer({super.key});

  @override
  State<EthSwitchTransfer> createState() => _EthSwitchTransferState();
}

class _EthSwitchTransferState extends State<EthSwitchTransfer> {
  String selectedBank = 'Please select bank';

  final TextEditingController _controller = TextEditingController();
  String? _errorMessage; // Holds validation error message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: AppBar(
        title: const Text(
          'EthSwitch Transfer',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Palette.primaryColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Palette.blackColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            bottom:
                MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
          ),
          child: Column(
            children: [
              // Top form section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Select Bank',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectBankPage()),
                        );
                        if (result != null) {
                          setState(() => selectedBank = result);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Palette.whiteColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedBank,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            const Icon(Icons.keyboard_arrow_down, size: 40)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Account Number',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorText: _errorMessage,
                        filled: true,
                        fillColor: Palette.whiteColor,
                        hintText: 'Enter Account Number',
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),

              // Recent Transactions Section
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Palette.whiteColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Recent Transactions',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        height: 360,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TransactionBox(
                                title: 'SELMAN ALI ABDUL',
                                accountNumber: '100023456789',
                              ),
                              TransactionBox(
                                title: 'Abdulrahman Khalid Ali',
                                accountNumber: '100045678912',
                              ),
                              TransactionBox(
                                title: 'Mariam Yusuf Ahmed',
                                accountNumber: '100078912345',
                              ),
                              TransactionBox(
                                title: 'Mohammed Omar Ibrahim',
                                accountNumber: '100091234567',
                              ),
                              TransactionBox(
                                title: 'Fatima Hassan Abdi',
                                accountNumber: '100012345678',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TransparentColorButton(
                          text: 'Continue',
                          onTap: () {
                            final input = _controller.text.trim();

                            if (input.isEmpty) {
                              setState(() {
                                _errorMessage = 'Account number cannot be empty.';
                              });
                            } else if (input.length < 8 || input.length > 12) {
                              setState(() {
                                _errorMessage = 'Account number must be 8-12 digits long.';
                              });
                            } else if (!RegExp(r'^[0-9]+$').hasMatch(input)) {
                              setState(() {
                                _errorMessage = 'Account number must contain only digits.';
                              });
                            } else {
                              setState(() {
                                _errorMessage = null; // No errors
                              });

                              // Navigate to the next page if input is valid
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         AmountSelectionPage(bankName: selectedBank, accountNumber: input,)),
                              );
                            }
                          }),
                      const SizedBox(height: 80), // Bottom safety padding
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionBox extends StatelessWidget {
  const TransactionBox(
      {super.key, required this.title, required this.accountNumber});

  final String title;
  final String accountNumber;

  String truncateWithEllipsis(int maxLength, String text) {
    if (text.length <= maxLength) {
      return text; // No need to truncate
    }
    return '${text.substring(0, maxLength)}...'; // Truncate and add ellipsis
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey, // Change to desired border color
            width: 1.0, // Set thickness of the underline
          ),
        ),
      ),
      child: ListTile(
        leading: Image.asset(
          Consts.cbeLogo,
          width: 40,
          height: 50,
        ),
        title: Text(
          truncateWithEllipsis(15, title), // Call the function here
          overflow: TextOverflow
              .ellipsis, // Ensure it still shows ellipsis when width is constrained
          maxLines: 1, // Restrict to one line
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Align rows properly
          children: [
            const Expanded(
              child: Text(
                'Commercial Bank of Ethiopia', // Subtitle on two lines
                maxLines: 2, // Restrict to 2 lines
                style: TextStyle(fontSize: 13),
              ),
            ),
            const Text('-'),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                accountNumber,
                maxLines: 1,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),
        contentPadding: const EdgeInsets.only(top: 8, left: 6),
      ),
    );
  }
}
