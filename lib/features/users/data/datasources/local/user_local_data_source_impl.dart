import 'dart:convert';

import 'package:financial_transfer_app/core/constants/default_admin.dart';
import 'package:financial_transfer_app/core/constants/storage_keys.dart';
import 'package:financial_transfer_app/features/users/data/datasources/local/user_local_data_source.dart';
import 'package:financial_transfer_app/features/users/data/models/user_model.dart';
import 'package:financial_transfer_app/features/users/domain/entities/user_role.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  UserLocalDataSourceImpl(
    this._preferences,
    this._uuid,
  );

  final SharedPreferences _preferences;
  final Uuid _uuid;

  @override
  Future<List<UserModel>> getUsers() async {
    final jsonString = _preferences.getString(StorageKeys.users);

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList
        .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> saveUsers(List<UserModel> users) async {
    final jsonString = jsonEncode(
      users.map((user) => user.toJson()).toList(),
    );

    await _preferences.setString(StorageKeys.users, jsonString);
  }

  @override
  Future<void> createDefaultAdmin() async {
    final users = await getUsers();

    final adminExists = users.any(
      (user) => user.role == UserRole.admin,
    );

    if (adminExists) {
      return;
    }

    final admin = UserModel(
      id: _uuid.v4(),
      name: DefaultAdmin.name,
      email: DefaultAdmin.email,
      password: DefaultAdmin.password,
      balance: DefaultAdmin.initialBalance,
      role: UserRole.admin,
      createdAt: DateTime.now(),
    );

    users.add(admin);

    await saveUsers(users);
  }

  @override
  Future<UserModel?> findByEmail(String email) async {
    // Lo implementaremos en el siguiente paso.
    return null;
  }

  @override
  Future<void> saveUser(UserModel user) async {
    // Lo implementaremos en el siguiente paso.
  }

  @override
  Future<void> updateUser(UserModel user) async {
    // Lo implementaremos en el siguiente paso.
  }

  @override
  Future<void> deleteUser(String userId) async {
    // Lo implementaremos en el siguiente paso.
  }

  @override
  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    final users = await getUsers();

    try {
      return users.firstWhere(
        (user) =>
            user.email.toLowerCase() == email.toLowerCase().trim() &&
            user.password == password,
      );
    } catch (_) {
      return null;
    }
  }
}