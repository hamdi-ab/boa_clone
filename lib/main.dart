import 'package:boa_clone/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/config/providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: appProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router(context),
      debugShowCheckedModeBanner: false,
      title: 'BOA Clone',
    );
  }
}