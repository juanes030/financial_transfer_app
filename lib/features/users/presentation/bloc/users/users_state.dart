import 'package:equatable/equatable.dart';
import 'package:financial_transfer_app/features/users/domain/entities/user_entity.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object?> get props => [];
}

class UsersInitial extends UsersState {
  const UsersInitial();
}

class UsersLoading extends UsersState {
  const UsersLoading();
}

class UsersLoaded extends UsersState {
  const UsersLoaded(this.users);

  final List<UserEntity> users;

  @override
  List<Object?> get props => [users];
}

class UsersFailure extends UsersState {
  const UsersFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}