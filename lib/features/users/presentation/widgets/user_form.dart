import 'package:financial_transfer_app/core/widgets/app_text_field.dart';
import 'package:financial_transfer_app/features/users/domain/entities/user_entity.dart';
import 'package:financial_transfer_app/features/users/domain/entities/user_role.dart';
import 'package:financial_transfer_app/features/users/presentation/bloc/users/users_bloc.dart';
import 'package:financial_transfer_app/features/users/presentation/bloc/users/users_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class UserForm extends StatefulWidget {
  const UserForm({
    super.key,
    this.user,
  });

  final UserEntity? user;

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _balanceController = TextEditingController();

  bool get isEditing => widget.user != null;

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      _nameController.text = widget.user!.name;
      _emailController.text = widget.user!.email;
      _passwordController.text = widget.user!.password;
      _balanceController.text = widget.user!.balance.toString();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  void _saveUser() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

  final user = UserEntity(
    id: widget.user?.id ?? const Uuid().v4(),
    name: _nameController.text.trim(),
    email: _emailController.text.trim(),
    password: _passwordController.text,
    balance: int.parse(_balanceController.text),
    role: widget.user?.role ?? UserRole.customer,
    createdAt: widget.user?.createdAt ?? DateTime.now(),
  );

    context.read<UsersBloc>().add(
          CreateUserRequested(user),
        );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppTextField(
            controller: _nameController,
            label: 'Nombre completo',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Ingrese el nombre';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          AppTextField(
            controller: _emailController,
            label: 'Correo electrónico',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Ingrese el correo';
              }

              if (!value.contains('@')) {
                return 'Correo inválido';
              }

              return null;
            },
          ),

          const SizedBox(height: 16),

          AppTextField(
            controller: _passwordController,
            label: 'Contraseña',
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese la contraseña';
              }

              if (value.length < 6) {
                return 'Debe tener mínimo 6 caracteres';
              }

              return null;
            },
          ),

          const SizedBox(height: 16),

          AppTextField(
            controller: _balanceController,
            label: 'Saldo inicial',
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese el saldo';
              }

              final balance = int.tryParse(value);

              if (balance == null) {
                return 'Saldo inválido';
              }

              if (balance < 0) {
                return 'El saldo no puede ser negativo';
              }

              return null;
            },
          ),

          const SizedBox(height: 32),

          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: _saveUser,
              child: Text(
                isEditing ? 'Actualizar usuario' : 'Guardar usuario',
              ),
            ),
          ),
        ],
      ),
    );
  }
}