import 'package:equatable/equatable.dart';
import 'package:financial_transfer_app/features/users/domain/entities/user_entity.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object?> get props => [];
}

class LoadUsersRequested extends UsersEvent {
  const LoadUsersRequested();
}

class CreateUserRequested extends UsersEvent {
  const CreateUserRequested(this.user);

  final UserEntity user;

  @override
  List<Object?> get props => [user];
}

class DeleteUserRequested extends UsersEvent {
  const DeleteUserRequested(this.userId);

  final String userId;

  @override
  List<Object?> get props => [userId];
}