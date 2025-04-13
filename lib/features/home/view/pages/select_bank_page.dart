import 'package:boa_clone/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class SelectBankPage extends StatelessWidget {
  const SelectBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'EthSwitch Transfer',
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              'Select Bank',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // BankSelectionContainer widgets
            BankSelectionContainer(title: 'Abay Bank'),
            BankSelectionContainer(title: 'Addis Bank'),
            BankSelectionContainer(title: 'Ahadu Bank'),
            BankSelectionContainer(title: 'Amhara Bank'),
            BankSelectionContainer(title: 'Anbesa Int. Bank'),
            BankSelectionContainer(title: 'Awash Bank'),
            BankSelectionContainer(title: 'Berhan International Bank'),
            BankSelectionContainer(title: 'Bunna Bank'),
            BankSelectionContainer(title: 'CBE Bank'),
            BankSelectionContainer(title: 'Commercial Bank of Ethiopia'),
            BankSelectionContainer(title: 'Cooperative Bank of Oromia'),
            BankSelectionContainer(title: 'Dashen Bank'),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class BankSelectionContainer extends StatelessWidget {
  const BankSelectionContainer({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey, // Border color
            width: 2.0, // Border thickness
          ),
        ),
      ),
      child: ListTile(
        leading: const Icon(Icons.account_balance),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.pop(context, title);
        },
      ),
    );
  }
}
