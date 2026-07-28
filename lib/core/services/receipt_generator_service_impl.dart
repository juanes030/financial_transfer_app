import 'package:financial_transfer_app/core/constants/storage_keys.dart';
import 'package:financial_transfer_app/core/services/receipt_generator_service.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: ReceiptGeneratorService)
class ReceiptGeneratorServiceImpl
    implements ReceiptGeneratorService {
  ReceiptGeneratorServiceImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<String> generateReceipt() async {
    final now = DateTime.now();

    final date = DateFormat('yyyyMMdd').format(now);

    final lastNumber = _preferences.getInt(
          StorageKeys.lastReceiptNumber,
        ) ??
        0;

    final nextNumber = lastNumber + 1;

    await _preferences.setInt(
      StorageKeys.lastReceiptNumber,
      nextNumber,
    );

    final consecutive =
        nextNumber.toString().padLeft(6, '0');

    return 'TRX-$date-$consecutive';
  }
}