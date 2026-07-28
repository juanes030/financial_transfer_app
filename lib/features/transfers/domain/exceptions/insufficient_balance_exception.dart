class InsufficientBalanceException implements Exception {
  const InsufficientBalanceException([
    this.message = 'Saldo insuficiente para realizar la transferencia.',
  ]);

  final String message;

  @override
  String toString() => message;
}