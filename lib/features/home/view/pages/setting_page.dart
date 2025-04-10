import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/features/home/view/widgets/setting_box.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Palette.primaryColor,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ))
        ],
      ),
      backgroundColor: Palette.primaryColor,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Palette.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26.0),
            topRight: Radius.circular(26.0),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 20,),
              SettingBox(title: 'Default Sign In',),
              SizedBox(height: 30,),
              Text('Device management', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 20,),
              SettingBox(title: 'Deregister Device',),
              SizedBox(height: 30,),
              Text('Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 20,),
              SettingBox(title: 'Change PIN',)
            ],
          ),
        ),
      ),
    );
  }
}
