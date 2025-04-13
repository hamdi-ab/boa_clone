import 'package:boa_clone/core/assets/consts.dart';
import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/custom_scaffold.dart';
import 'package:boa_clone/features/home/view/pages/transfer_type_page.dart';
import 'package:boa_clone/features/home/view/widgets/transfer_page_container.dart';
import 'package:flutter/material.dart';

class TransfersPage extends StatelessWidget {
  const TransfersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(
      title: 'Transfers',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const TransferPageContainer(
                    iconWidget: Icon(
                      Icons.swap_horiz,
                      color: Palette.primaryColor,
                      size: 35,
                    ),
                    title: 'Transfer to BOA Customer',
                    subtitle: 'Transfer funds to another BOA account',
                  ),
                  const TransferPageContainer(
                    iconWidget: Icon(
                      Icons.swap_horiz,
                      color: Palette.primaryColor,
                      size: 35,
                    ),
                    title: 'Transfer within BOA',
                    subtitle: 'Transfer to an account in the same bank',
                  ),
                  TransferPageContainer(
                    iconWidget: const Icon(
                      Icons.swap_horiz,
                      color: Palette.primaryColor,
                      size: 35,
                    ),
                    title: 'Transfer to other bank',
                    subtitle: 'Transfer to an external bank account',
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TransferTypePage()));
                    },
                  ),
                  TransferPageContainer(
                    iconWidget: Image.asset(
                      Consts.telebirrLogo,
                      width: 40,
                      height: 50,
                    ),
                    title: 'telebirr',
                    subtitle: 'Transfer to telebirr',
                  ),
                  const TransferPageContainer(
                    iconWidget: Icon(
                      Icons.swap_horiz,
                      color: Palette.primaryColor,
                      size: 35,
                    ),
                    title: 'ATM Transfer',
                    subtitle: 'Transfer and withdraw money from ATM without card',
                  ),
                  const TransferPageContainer(
                    iconWidget: Icon(
                      Icons.swap_horiz,
                      color: Palette.primaryColor,
                      size: 35,
                    ),
                    title: 'Awach',
                    subtitle: 'Transfer To Awach Account',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}