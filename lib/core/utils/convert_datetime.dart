import 'package:intl/intl.dart';

String formatDateToAmerican(DateTime date) {
  final DateFormat formatter = DateFormat('MM/dd/yyyy');
  return formatter.format(date);
}
