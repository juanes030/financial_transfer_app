import 'package:financial_transfer_app/features/users/data/models/user_model.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> getUsers();

  Future<void> saveUsers(List<UserModel> users);

  Future<void> createDefaultAdmin();

  Future<UserModel?> findByEmail(String email);

  Future<void> saveUser(UserModel user);

  Future<void> updateUser(UserModel user);

  Future<void> deleteUser(String userId);
}