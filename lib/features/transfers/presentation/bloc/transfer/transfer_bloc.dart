import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:financial_transfer_app/features/transfers/domain/exceptions/insufficient_balance_exception.dart';
import 'package:financial_transfer_app/features/transfers/domain/exceptions/invalid_transfer_amount_exception.dart';
import 'package:financial_transfer_app/features/transfers/domain/exceptions/same_user_transfer_exception.dart';
import 'package:financial_transfer_app/features/transfers/domain/exceptions/user_not_found_exception.dart';
import 'package:financial_transfer_app/features/transfers/domain/usecases/perform_transfer_params.dart';
import 'package:financial_transfer_app/features/transfers/domain/usecases/perform_transfer_usecase.dart';

import 'transfer_event.dart';
import 'transfer_state.dart';

@injectable
class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc(
    this._performTransferUseCase,
  ) : super(const TransferInitial()) {
    on<PerformTransferRequested>(
      _onPerformTransferRequested,
    );
    on<ResetTransferStateRequested>(
      (_, emit) => emit(const TransferInitial()),
    );
  }

  final PerformTransferUseCase _performTransferUseCase;

  Future<void> _onPerformTransferRequested(
    PerformTransferRequested event,
    Emitter<TransferState> emit,
  ) async {
    emit(const TransferLoading());

    try {
      final transfer = await _performTransferUseCase(
        PerformTransferParams(
          sourceUserId: event.sourceUserId,
          destinationUserId: event.destinationUserId,
          amount: event.amount,
        ),
      );

      emit(
        TransferSuccess(transfer),
      );
    } on InsufficientBalanceException catch (e) {
      emit(
        TransferFailure(e.message),
      );
    } on InvalidTransferAmountException catch (e) {
      emit(
        TransferFailure(e.message),
      );
    } on SameUserTransferException catch (e) {
      emit(
        TransferFailure(e.message),
      );
    } on UserNotFoundException catch (e) {
      emit(
        TransferFailure(e.message),
      );
    } catch (_) {
      emit(
        const TransferFailure(
          'Ocurrió un error inesperado al realizar la transferencia.',
        ),
      );
    }
  }
}