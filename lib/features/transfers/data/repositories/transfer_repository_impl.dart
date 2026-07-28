import 'package:financial_transfer_app/features/transfers/data/datasources/local/transfer_local_data_source.dart';
import 'package:financial_transfer_app/features/transfers/data/models/transfer_model.dart';
import 'package:financial_transfer_app/features/transfers/domain/entities/transfer_entity.dart';
import 'package:financial_transfer_app/features/transfers/domain/repositories/transfer_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TransferRepository)
class TransferRepositoryImpl
    implements TransferRepository {
  TransferRepositoryImpl(
    this._localDataSource,
  );

  final TransferLocalDataSource _localDataSource;

  @override
  Future<List<TransferEntity>> getTransfers() {
    return _localDataSource.getTransfers();
  }

  @override
  Future<void> saveTransfer(
    TransferEntity transfer,
  ) {
    return _localDataSource.saveTransfer(
      TransferModel.fromEntity(transfer),
    );
  }
}