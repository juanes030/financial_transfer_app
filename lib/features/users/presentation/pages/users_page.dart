import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a Financial Transfer App',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}