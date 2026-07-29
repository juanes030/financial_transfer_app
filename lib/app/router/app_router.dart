import 'package:financial_transfer_app/features/auth/presentation/pages/login_page.dart';
import 'package:financial_transfer_app/features/home/presentation/pages/home_page.dart';
import 'package:financial_transfer_app/features/transfers/presentation/pages/transfer_page.dart';
import 'package:financial_transfer_app/features/users/presentation/pages/create_user_page.dart';
import 'package:financial_transfer_app/features/users/presentation/pages/users_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/users',
        builder: (context, state) => const UsersPage(),
      ),
      GoRoute(
        path: '/users/create',
        builder: (context, state) => const CreateUserPage(),
      ),
      GoRoute(
        path: '/transfers',
        builder: (context, state) => const TransferPage(),
      ),
    ],
  );
}