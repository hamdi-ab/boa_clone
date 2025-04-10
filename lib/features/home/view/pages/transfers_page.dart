import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/custom_scaffold.dart';
import 'package:boa_clone/features/home/view/widgets/transfer_page_container.dart';
import 'package:flutter/material.dart';

class TransfersPage extends StatelessWidget {
  const TransfersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Transfers',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              TransferPageContainer(
                iconData: Icons.account_balance,
                title: 'Transfer to Own Account',
                subtitle: 'Transfer funds within my accounts',
              ),
              TransferPageContainer(
                iconData: Icons.account_balance,
                title: 'Transfer within BOA',
                subtitle: 'Transfer to an account in the same bank',
              ),
              TransferPageContainer(
                iconData: Icons.account_balance,
                title: 'Transfer to other bank',
                subtitle: 'Transfer to an external bank account',
              ),
              TransferPageContainer(
                iconData: Icons.account_balance,
                title: 'telebirr',
                subtitle: 'Transfer to telebirr',
              ),
              TransferPageContainer(
                iconData: Icons.account_balance,
                title: 'ATM Transfer',
                subtitle: 'Transfer and withdraw money from ATM without card',
              ),
              TransferPageContainer(
                iconData: Icons.account_balance,
                title: 'Awach',
                subtitle: 'Transfer To Awach Account',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
