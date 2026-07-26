import 'package:financial_transfer_app/features/users/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> createDefaultAdmin();

  Future<List<UserEntity>> getUsers();

  Future<UserEntity?> findByEmail(String email);

  Future<void> saveUser(UserEntity user);

  Future<void> updateUser(UserEntity user);

  Future<void> deleteUser(String userId);
}