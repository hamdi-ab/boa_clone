import 'package:boa_clone/features/auth/view/pages/activate_page.dart';
import 'package:boa_clone/features/auth/view/pages/first_page.dart';
import 'package:boa_clone/features/auth/view/pages/sign_in_page.dart';
import 'package:boa_clone/features/home/view/pages/transaction_filter_screen.dart';
import 'package:boa_clone/features/home/view/pages/transaction_page.dart';
import 'package:boa_clone/features/home/view/pages/home_page.dart';
import 'package:boa_clone/features/home/view/pages/transfers_page.dart';
import 'package:boa_clone/features/home/view/pages/utilities_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static bool isAuthenticated = true; // Mock authentication state

  static final GoRouter router = GoRouter(
    initialLocation: '/', // Default starting route
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => isAuthenticated ? '/home' : '/auth',
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const FirstPage(),
        routes: [
          GoRoute(
            path: 'active',
            builder: (context, state) => const ActivatePage(),
          ),
          GoRoute(
            path: 'Login',
            builder: (context, state) => const SignInPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'transfer', // Nested Transfer route
            builder: (context, state) => const TransfersPage(),
          ),
          GoRoute(
            path: 'utilities', // Nested Utilities route
            builder: (context, state) => const UtilitiesPage(),
          ),
          GoRoute(
            path: 'transaction', // Nested Transaction route
            builder: (context, state) =>  TransactionFilterScreen(),
          ),
        ],
      ),
    ],
  );
}
