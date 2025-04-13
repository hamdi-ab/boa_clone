import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/custom_scaffold.dart';
import 'package:boa_clone/features/home/view/pages/eth_switch_transfer.dart';
import 'package:boa_clone/features/home/view/widgets/transfer_page_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransferAccountsPage extends StatelessWidget {
  const TransferAccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Accounts',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Text('From Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            const SizedBox(height: 16,),
            GestureDetector(
                child: const TransferPageContainer(
                    iconWidget: Icon(
                      CupertinoIcons.briefcase,
                      size: 35,
                      color: Palette.primaryColor,
                    ),
                    title: 'FItayah Savings',
                    subtitle: '95211348'),
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EthSwitchTransfer()));
              },
            )
          ],
        ));
  }
}
