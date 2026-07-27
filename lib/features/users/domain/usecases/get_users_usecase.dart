import 'package:financial_transfer_app/features/users/domain/entities/user_entity.dart';
import 'package:financial_transfer_app/features/users/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUsersUseCase {
  GetUsersUseCase(this._repository);

  final UserRepository _repository;

  Future<List<UserEntity>> call() {
    return _repository.getUsers();
  }
}