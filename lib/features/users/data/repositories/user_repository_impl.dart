import 'package:financial_transfer_app/features/users/data/datasources/local/user_local_data_source.dart';
import 'package:financial_transfer_app/features/users/data/models/user_model.dart';
import 'package:financial_transfer_app/features/users/domain/entities/user_entity.dart';
import 'package:financial_transfer_app/features/users/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._localDataSource);

  final UserLocalDataSource _localDataSource;

  @override
  Future<void> createDefaultAdmin() {
    return _localDataSource.createDefaultAdmin();
  }

  @override
  Future<List<UserEntity>> getUsers() {
    return _localDataSource.getUsers();
  }

  @override
  Future<UserEntity?> findByEmail(String email) {
    return _localDataSource.findByEmail(email);
  }

  @override
  Future<void> saveUser(UserEntity user) {
    return _localDataSource.saveUser(
      UserModel.fromEntity(user),
    );
  }

  @override
  Future<void> updateUser(UserEntity user) {
    return _localDataSource.updateUser(
      UserModel.fromEntity(user),
    );
  }

  @override
  Future<void> deleteUser(String userId) {
    return _localDataSource.deleteUser(userId);
  }

  @override
  Future<UserEntity?> login({
    required String email,
    required String password,
  }) {
    return _localDataSource.login(
      email: email,
      password: password,
    );
  }
}