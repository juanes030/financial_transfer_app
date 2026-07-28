class SameUserTransferException implements Exception {
  const SameUserTransferException([
    this.message =
        'No es posible realizar una transferencia al mismo usuario.',
  ]);

  final String message;

  @override
  String toString() => message;
}