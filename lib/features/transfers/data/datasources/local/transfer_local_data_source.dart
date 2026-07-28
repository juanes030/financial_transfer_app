import 'package:financial_transfer_app/features/transfers/data/models/transfer_model.dart';

abstract class TransferLocalDataSource {
  Future<List<TransferModel>> getTransfers();

  Future<void> saveTransfers(
    List<TransferModel> transfers,
  );

  Future<void> saveTransfer(
    TransferModel transfer,
  );
}