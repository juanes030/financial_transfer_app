import 'package:bloc/bloc.dart';
import 'package:financial_transfer_app/features/users/domain/usecases/create_user_usecase.dart';
import 'package:financial_transfer_app/features/users/domain/usecases/delete_user_usecase.dart';
import 'package:financial_transfer_app/features/users/domain/usecases/get_users_usecase.dart';
import 'package:injectable/injectable.dart';

import 'users_event.dart';
import 'users_state.dart';

@injectable
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc(
    this._getUsersUseCase,
    this._createUserUseCase,
    this._deleteUserUseCase,
  ) : super(const UsersInitial()) {
    on<LoadUsersRequested>(_onLoadUsers);
    on<CreateUserRequested>(_onCreateUser);
    on<DeleteUserRequested>(_onDeleteUser);
  }

  final GetUsersUseCase _getUsersUseCase;
  final CreateUserUseCase _createUserUseCase;
  final DeleteUserUseCase _deleteUserUseCase;

  Future<void> _onLoadUsers(
    LoadUsersRequested event,
    Emitter<UsersState> emit,
  ) async {
    emit(const UsersLoading());

    try {
      final users = await _getUsersUseCase();

      emit(UsersLoaded(users));
    } catch (e) {
      emit(
        UsersFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onCreateUser(
    CreateUserRequested event,
    Emitter<UsersState> emit,
  ) async {
    try {
      await _createUserUseCase(event.user);

      final users = await _getUsersUseCase();

      emit(
        UsersLoaded(users),
      );
    } catch (e) {
      emit(
        UsersFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _onDeleteUser(
    DeleteUserRequested event,
    Emitter<UsersState> emit,
  ) async {
    try {
      await _deleteUserUseCase(event.userId);

      final users = await _getUsersUseCase();

      emit(
        UsersLoaded(users),
      );
    } catch (e) {
      emit(
        UsersFailure(
          e.toString(),
        ),
      );
    }
  }
}