import 'package:equatable/equatable.dart';
import 'package:financial_transfer_app/features/transfers/domain/entities/transfer_entity.dart';

class TransferState extends Equatable {
  const TransferState();

  @override
  List<Object?> get props => [];
}

class TransferInitial extends TransferState {
  const TransferInitial();
}

class TransferLoading extends TransferState {
  const TransferLoading();
}

class TransferSuccess extends TransferState {
  const TransferSuccess(this.transfer);

  final TransferEntity transfer;

  @override
  List<Object?> get props => [transfer];
}

class TransferFailure extends TransferState {
  const TransferFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}