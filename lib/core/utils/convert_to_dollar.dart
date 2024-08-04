import 'package:intl/intl.dart';

String convertToDollars(int amount) {
  final NumberFormat formatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: '\$',
    decimalDigits: 0,
  );
  return formatter.format(amount);
}
