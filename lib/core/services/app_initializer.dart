import 'package:financial_transfer_app/features/users/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppInitializer {
  AppInitializer(this._userRepository);

  final UserRepository _userRepository;

  Future<void> initialize() async {
    await _userRepository.createDefaultAdmin();
  }
}