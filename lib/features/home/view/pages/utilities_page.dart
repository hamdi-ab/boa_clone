import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/custom_scaffold.dart';
import 'package:boa_clone/features/home/view/widgets/transfer_page_container.dart';
import 'package:flutter/material.dart';

class UtilitiesPage extends StatelessWidget {
  const UtilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Utilities',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              TransferPageContainer(
                iconWidget: Icon(
                  Icons.swap_horiz,
                  color: Palette.primaryColor,
                  size: 25,
                ),
                title: 'Airtime Topup and package',
                subtitle: 'Buy phone top up credit online',
              ),
              TransferPageContainer(
                iconWidget: Icon(
                  Icons.swap_horiz,
                  color: Palette.primaryColor,
                  size: 25,
                ),
                title: 'Ethiopian Airlines',
                subtitle: 'Pay Ethiotelecom Bills',
              ),
              TransferPageContainer(
                iconWidget: Icon(
                  Icons.swap_horiz,
                  color: Palette.primaryColor,
                  size: 25,
                ),
                title: 'DSTV',
                subtitle: 'Pay Your DSTV Package Payments',
              ),
              TransferPageContainer(
                iconWidget: Icon(
                  Icons.swap_horiz,
                  color: Palette.primaryColor,
                  size: 25,
                ),
                title: 'US Visa',
                subtitle: 'Make Payments to your internet service bills',
              ),
              TransferPageContainer(
                iconWidget: Icon(
                  Icons.swap_horiz,
                  color: Palette.primaryColor,
                  size: 25,
                ),
                title: 'Websprix',
                subtitle: 'Transfer and withdraw money from ATM without card',
              ),
              TransferPageContainer(
                iconWidget: Icon(
                  Icons.swap_horiz,
                  color: Palette.primaryColor,
                  size: 25,
                ),
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
