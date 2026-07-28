import 'dart:convert';

import 'package:financial_transfer_app/core/constants/storage_keys.dart';
import 'package:financial_transfer_app/features/transfers/data/datasources/local/transfer_local_data_source.dart';
import 'package:financial_transfer_app/features/transfers/data/models/transfer_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: TransferLocalDataSource)
class TransferLocalDataSourceImpl
    implements TransferLocalDataSource {
  TransferLocalDataSourceImpl(
    this._preferences,
  );

  final SharedPreferences _preferences;

  @override
  Future<List<TransferModel>> getTransfers() async {
    final jsonString = _preferences.getString(
      StorageKeys.transfers,
    );

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    final List<dynamic> jsonList =
        jsonDecode(jsonString);

    return jsonList
        .map(
          (json) => TransferModel.fromJson(
            json as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  @override
  Future<void> saveTransfers(
    List<TransferModel> transfers,
  ) async {
    final json = jsonEncode(
      transfers
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    );

    await _preferences.setString(
      StorageKeys.transfers,
      json,
    );
  }

  @override
  Future<void> saveTransfer(
    TransferModel transfer,
  ) async {
    final transfers = await getTransfers();

    transfers.add(transfer);

    await saveTransfers(transfers);
  }
}