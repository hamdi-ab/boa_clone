import 'package:boa_clone/core/auth_state.dart';
import 'package:boa_clone/features/auth/view/pages/activate_page.dart';
import 'package:boa_clone/features/auth/view/pages/first_page.dart';
import 'package:boa_clone/features/auth/view/pages/sign_in_page.dart';
import 'package:boa_clone/features/home/view/pages/home_page.dart';
import 'package:boa_clone/features/home/view/pages/transaction_page.dart';
import 'package:boa_clone/features/home/view/pages/transfers_page.dart';
import 'package:boa_clone/features/home/view/pages/utilities_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static GoRouter router(BuildContext context) {
    final authState = Provider.of<AuthState>(context, listen: false);

    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true, // Add this for route debugging
      redirect: (context, state) {
        final isAuthenticated = authState.isAuthenticated;
        final isLoggingIn = state.uri.toString().startsWith('/auth');

        if (!isAuthenticated && !isLoggingIn) return '/auth';
        if (isAuthenticated && isLoggingIn) return '/home';
        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          redirect: (context, state) => authState.isAuthenticated ? '/home' : '/auth',
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
              path: 'transfer',
              builder: (context, state) => const TransfersPage(),
            ),
            GoRoute(
              path: 'utilities',
              builder: (context, state) => const UtilitiesPage(),
            ),
            GoRoute(
              path: 'transaction',
              builder: (context, state) =>  const TransactionPage(),
            ),
          ],
        ),
      ],
      refreshListenable: authState,
    );
  }
}