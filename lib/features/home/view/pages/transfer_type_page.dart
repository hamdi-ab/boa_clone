import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/core/widgets/custom_scaffold.dart';
import 'package:boa_clone/features/home/view/pages/transaction_filter_screen.dart';
import 'package:boa_clone/features/home/view/pages/transfer_accounts_page.dart';
import 'package:flutter/material.dart';

class TransferTypePage extends StatelessWidget {
  const TransferTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(title: 'Transfers', child: Column(
      children: [
        const SizedBox(height: 20,),
        CustomContainer(title: 'Instant Transfer',subtitle: 'Transfer to an external bank account',onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const TransferAccountsPage()));
        },),
        const SizedBox(height: 16,),
        CustomContainer(title: 'Non-Instant Transfer',subtitle: 'Transfer to an external bank account', onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionFilterScreen()));
        },)
      ],
    ));
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key, required this.title, required this.subtitle, required this.onTap,
  });
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: null,
          borderRadius: BorderRadius.circular(8),
          color: Palette.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.help_outline_outlined, color: Palette.primaryColor,),
        ),
      ),
    );
  }
}
