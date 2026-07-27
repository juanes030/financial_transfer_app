import 'package:financial_transfer_app/features/users/domain/entities/user_entity.dart';
import 'package:financial_transfer_app/features/users/presentation/widgets/user_form.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({
    super.key,
    this.user,
  });

  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user == null ? 'Crear usuario' : 'Editar usuario',
        ),
      ),
      body: UserForm(
        user: user,
      ),
    );
  }
}