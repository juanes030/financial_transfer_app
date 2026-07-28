class InvalidTransferAmountException implements Exception {
  const InvalidTransferAmountException([
    this.message = 'El valor de la transferencia debe ser mayor que cero.',
  ]);

  final String message;

  @override
  String toString() => message;
}