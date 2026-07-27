import 'package:financial_transfer_app/features/auth/presentation/pages/login_page.dart';
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
        path: '/users',
        builder: (context, state) => const UsersPage(),
      ),
      GoRoute(
        path: '/users/create',
        builder: (context, state) => const CreateUserPage(),
      ),
    ],
  );
}