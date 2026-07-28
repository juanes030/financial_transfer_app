import 'package:equatable/equatable.dart';

class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object?> get props => [];
}

class PerformTransferRequested extends TransferEvent {
  const PerformTransferRequested({
    required this.sourceUserId,
    required this.destinationUserId,
    required this.amount,
  });

  final String sourceUserId;
  final String destinationUserId;
  final int amount;

  @override
  List<Object?> get props => [
        sourceUserId,
        destinationUserId,
        amount,
      ];
}

class ResetTransferStateRequested extends TransferEvent {
  const ResetTransferStateRequested();
}