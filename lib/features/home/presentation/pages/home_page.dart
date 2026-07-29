import 'package:financial_transfer_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:financial_transfer_app/features/auth/presentation/bloc/auth/auth_state.dart';
import 'package:financial_transfer_app/features/home/presentation/widgets/home_menu_card.dart';
import 'package:financial_transfer_app/features/users/domain/entities/user_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;

    if (authState is! AuthAuthenticated) {
      return const SizedBox.shrink();
    }

    final currentUser = authState.user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Transfer App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Bienvenido, ${currentUser.name} 👋',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currentUser.role == UserRole.admin
                        ? 'Administrador'
                        : 'Cliente',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Selecciona una opción para continuar.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),

                  if (currentUser.role == UserRole.admin) ...[
                    HomeMenuCard(
                      icon: Icons.people,
                      title: 'Usuarios',
                      subtitle: 'Administrar usuarios',
                      onTap: () => context.push('/users'),
                    ),
                  ]

                  else ...[
                    HomeMenuCard(
                      icon: Icons.swap_horiz,
                      title: 'Transferencias',
                      subtitle: 'Realizar una transferencia',
                      onTap: () => context.push('/transfers'),
                    ),
                  ],

                  const Spacer(),

                  OutlinedButton.icon(
                    onPressed: () {
                      context.go('/login');
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text(
                      'Cerrar sesión',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}