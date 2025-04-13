import 'package:boa_clone/core/assets/consts.dart';
import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    super.key,
    required this.children,
    required this.top,
    required this.bottom,
    this.bottomNavigationBar, // Optional bottom navigation
  });

  final double top;
  final double bottom;
  final List<Widget> children;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
      ),
      backgroundColor: Palette.primaryColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: top, bottom: bottom),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Consts.abyssiniaBankLogo,
                  width: 280,
                  height: 65,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Palette.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26.0),
                  topRight: Radius.circular(26.0),
                ),
              ),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                  children: children,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar, // Optional bottom navigation
    );
  }
}
