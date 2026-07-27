import 'package:financial_transfer_app/features/users/domain/entities/user_entity.dart';
import 'package:financial_transfer_app/features/users/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateUserUseCase {
  CreateUserUseCase(this._repository);

  final UserRepository _repository;

  Future<void> call(UserEntity user) {
    return _repository.saveUser(user);
  }
}