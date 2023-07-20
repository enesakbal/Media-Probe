import 'package:intl/intl.dart';

extension ConvertToDate on String {
  String toDate() => DateFormat('d MMMM yyyy').format(DateTime.tryParse(this) ?? DateTime.now());
}
