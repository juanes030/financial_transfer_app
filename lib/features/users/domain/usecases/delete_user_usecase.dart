import 'package:financial_transfer_app/features/users/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteUserUseCase {
  DeleteUserUseCase(this._repository);

  final UserRepository _repository;

  Future<void> call(String userId) {
    return _repository.deleteUser(userId);
  }
}