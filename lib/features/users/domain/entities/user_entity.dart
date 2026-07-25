import 'package:equatable/equatable.dart';

import 'user_role.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;
  final int balance;
  final UserRole role;
  final DateTime createdAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.balance,
    required this.role,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    password,
    balance,
    role,
    createdAt,
  ];
}