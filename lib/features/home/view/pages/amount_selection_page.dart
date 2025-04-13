import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/custom_scaffold.dart';
import 'package:boa_clone/core/widgets/transparent_color_button.dart';
import 'package:boa_clone/features/home/view/pages/review_page.dart';
import 'package:flutter/material.dart';

class AmountSelectionPage extends StatefulWidget {
  const AmountSelectionPage(
      {super.key, required this.bankName, required this.accountNumber});
  final String bankName;
  final String accountNumber;

  @override
  State<AmountSelectionPage> createState() => _AmountSelectionPageState();
}

class _AmountSelectionPageState extends State<AmountSelectionPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'EthSwitch Transfer',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Verify the Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 8),
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
                      child: const Text(
                        'SELMAN ALI ABDURHMAN',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Enter Amount',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // Shadow color
                        spreadRadius:
                            0, // Avoid spreading the shadow in all directions
                        blurRadius: 6, // Smoothness of the shadow edges
                        offset: const Offset(0, 6),
                      ),
                    ]),
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        fillColor: Palette.whiteColor,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Palette.greyColor, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Palette.greyColor, width: 0.0),
                          // Focused state
                        ),
                        hintText: '0.0',
                        hintStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        prefixIcon: SizedBox(
                            width: 60,
                            height: 60,
                            child: Center(
                                child: Text(
                              'ETB',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ))),
                        contentPadding: EdgeInsets.symmetric(vertical: 18),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 360,
              ),
              TransparentColorButton(
                  text: 'Continue',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReviewPage(
                                  accountNumber: widget.accountNumber,
                                  amount: _controller.text,
                                  bankName: widget.bankName,
                                )));
                  }),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
