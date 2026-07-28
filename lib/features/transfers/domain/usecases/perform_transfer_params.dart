class PerformTransferParams {
  const PerformTransferParams({
    required this.sourceUserId,
    required this.destinationUserId,
    required this.amount,
  });

  final String sourceUserId;

  final String destinationUserId;

  final int amount;
}