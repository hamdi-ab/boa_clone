import 'package:boa_clone/core/navigation/app_router.dart';
import 'package:boa_clone/core/themes/app_theme.dart';
import 'package:boa_clone/features/auth/view/pages/first_page.dart';
import 'package:boa_clone/features/home/view/pages/home_page.dart';
import 'package:boa_clone/features/home/view/pages/setting_page.dart';
import 'package:boa_clone/features/home/view/pages/transfers_page.dart';
import 'package:boa_clone/features/home/view/pages/utilities_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
    );
  }
}

