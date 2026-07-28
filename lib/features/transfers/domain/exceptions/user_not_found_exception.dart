class UserNotFoundException implements Exception {
  const UserNotFoundException([
    this.message = 'El usuario no fue encontrado.',
  ]);

  final String message;

  @override
  String toString() => message;
}