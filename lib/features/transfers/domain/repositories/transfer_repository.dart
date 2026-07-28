import 'package:financial_transfer_app/features/transfers/domain/entities/transfer_entity.dart';

abstract class TransferRepository {
  Future<List<TransferEntity>> getTransfers();

  Future<void> saveTransfer(TransferEntity transfer);
}