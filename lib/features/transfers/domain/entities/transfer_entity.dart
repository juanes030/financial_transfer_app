import 'package:equatable/equatable.dart';

class TransferEntity extends Equatable {
  final String id;
  final String receiptNumber;

  final String sourceUserId;
  final String sourceUserName;

  final String destinationUserId;
  final String destinationUserName;

  final int amount;

  final DateTime createdAt;

  const TransferEntity({
    required this.id,
    required this.receiptNumber,
    required this.sourceUserId,
    required this.sourceUserName,
    required this.destinationUserId,
    required this.destinationUserName,
    required this.amount,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    receiptNumber,
    sourceUserId,
    sourceUserName,
    destinationUserId,
    destinationUserName,
    amount,
    createdAt,
  ];
}