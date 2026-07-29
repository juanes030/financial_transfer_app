import 'package:financial_transfer_app/features/home/presentation/widgets/home_menu_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'Bienvenido 👋',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Selecciona una opción para continuar.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),

                  HomeMenuCard(
                    icon: Icons.people,
                    title: 'Usuarios',
                    subtitle: 'Administrar usuarios',
                    onTap: () => context.push('/users'),
                  ),

                  const SizedBox(height: 16),

                  HomeMenuCard(
                    icon: Icons.swap_horiz,
                    title: 'Transferencias',
                    subtitle: 'Realizar una transferencia',
                    onTap: () => context.push('/transfers'),
                  ),

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