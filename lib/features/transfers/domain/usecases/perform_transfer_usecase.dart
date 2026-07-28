import 'package:financial_transfer_app/core/services/receipt_generator_service.dart';
import 'package:financial_transfer_app/features/transfers/domain/entities/transfer_entity.dart';
import 'package:financial_transfer_app/features/transfers/domain/exceptions/insufficient_balance_exception.dart';
import 'package:financial_transfer_app/features/transfers/domain/exceptions/invalid_transfer_amount_exception.dart';
import 'package:financial_transfer_app/features/transfers/domain/exceptions/same_user_transfer_exception.dart';
import 'package:financial_transfer_app/features/transfers/domain/exceptions/user_not_found_exception.dart';
import 'package:financial_transfer_app/features/transfers/domain/repositories/transfer_repository.dart';
import 'package:financial_transfer_app/features/users/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import 'perform_transfer_params.dart';

@injectable
class PerformTransferUseCase {
  PerformTransferUseCase(
    this._userRepository,
    this._transferRepository,
    this._receiptGenerator,
    this._uuid,
  );

  final UserRepository _userRepository;
  final TransferRepository _transferRepository;
  final ReceiptGeneratorService _receiptGenerator;
  final Uuid _uuid;

  Future<TransferEntity> call(
    PerformTransferParams params,
  ) async {
    final sourceUser = await _userRepository.findById(
      params.sourceUserId,
    );

    final destinationUser = await _userRepository.findById(
      params.destinationUserId,
    );

    if (sourceUser == null || destinationUser == null) {
      throw const UserNotFoundException();
    }

    if (sourceUser.id == destinationUser.id) {
      throw const SameUserTransferException();
    }

    if (params.amount <= 0) {
      throw const InvalidTransferAmountException();
    }

    if (sourceUser.balance < params.amount) {
      throw const InsufficientBalanceException();
    }

    final updatedSource = sourceUser.copyWith(
      balance: sourceUser.balance - params.amount,
    );

    final updatedDestination = destinationUser.copyWith(
      balance: destinationUser.balance + params.amount,
    );

    await _userRepository.updateUsers(
      sourceUser: updatedSource,
      destinationUser: updatedDestination,
    );

    final receiptNumber =
        await _receiptGenerator.generateReceipt();

    final transfer = TransferEntity(
      id: _uuid.v4(),
      receiptNumber: receiptNumber,
      sourceUserId: sourceUser.id,
      sourceUserName: sourceUser.name,
      destinationUserId: destinationUser.id,
      destinationUserName: destinationUser.name,
      amount: params.amount,
      createdAt: DateTime.now(),
    );

    await _transferRepository.saveTransfer(
      transfer,
    );

    return transfer;
  }
}