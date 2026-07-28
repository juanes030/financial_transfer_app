import 'package:financial_transfer_app/features/transfers/domain/entities/transfer_entity.dart';

class TransferModel extends TransferEntity {
  const TransferModel({
    required super.id,
    required super.receiptNumber,
    required super.sourceUserId,
    required super.sourceUserName,
    required super.destinationUserId,
    required super.destinationUserName,
    required super.amount,
    required super.createdAt,
  });

  factory TransferModel.fromEntity(TransferEntity entity) {
    return TransferModel(
      id: entity.id,
      receiptNumber: entity.receiptNumber,
      sourceUserId: entity.sourceUserId,
      sourceUserName: entity.sourceUserName,
      destinationUserId: entity.destinationUserId,
      destinationUserName: entity.destinationUserName,
      amount: entity.amount,
      createdAt: entity.createdAt,
    );
  }

  factory TransferModel.fromJson(Map<String, dynamic> json) {
    return TransferModel(
      id: json['id'],
      receiptNumber: json['receiptNumber'],
      sourceUserId: json['sourceUserId'],
      sourceUserName: json['sourceUserName'],
      destinationUserId: json['destinationUserId'],
      destinationUserName: json['destinationUserName'],
      amount: json['amount'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'receiptNumber': receiptNumber,
      'sourceUserId': sourceUserId,
      'sourceUserName': sourceUserName,
      'destinationUserId': destinationUserId,
      'destinationUserName': destinationUserName,
      'amount': amount,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}