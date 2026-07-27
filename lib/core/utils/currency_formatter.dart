import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final money = NumberFormat.currency(
    locale: 'es_CO',
    symbol: '\$',
    decimalDigits: 2,
  );
}