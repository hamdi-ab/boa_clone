import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/custom_scaffold.dart';
import 'package:boa_clone/features/home/view/widgets/transfer_page_container.dart';
import 'package:flutter/material.dart';

class UtilitiesPage extends StatelessWidget {
  const UtilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Utilitites',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              TransferPageContainer(
                iconData: Icons.sim_card,
                title: 'Airtime Topup and package',
                subtitle: 'Buy phone top up credit online',
                iconSize: 25,
              ),
              TransferPageContainer(
                iconData: Icons.account_balance,
                title: 'Ethiopian Airlines',
                subtitle: 'Pay Ethiotelecom Bills',
                iconSize: 25,
              ),
              TransferPageContainer(
                iconData: Icons.account_balance,
                title: 'DSTV',
                subtitle: 'Pay Your DSTV Package Payments',
                iconSize: 25,
              ),
              TransferPageContainer(
                iconData: Icons.account_balance,
                title: 'US Visa',
                subtitle: 'Make Payments to your internet service bills',
                iconSize: 25,
              ),
              TransferPageContainer(
                iconData: Icons.account_balance,
                title: 'Websprix',
                subtitle: 'Transfer and withdraw money from ATM without card',
                iconSize: 25,
              ),
              TransferPageContainer(
                iconData: Icons.account_balance,
                title: 'Awach',
                subtitle: 'Transfer To Awach Account',
                iconSize: 25,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
