import 'package:financial_transfer_app/features/users/domain/entities/user_entity.dart';
import 'package:financial_transfer_app/features/users/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  LoginUseCase(this._repository);

  final UserRepository _repository;

  Future<UserEntity?> call({
    required String email,
    required String password,
  }) {
    return _repository.login(
      email: email,
      password: password,
    );
  }
}