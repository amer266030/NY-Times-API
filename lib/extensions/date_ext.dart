import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime {
  // Convert DateTime to the format "Jul 13, 2023"
  String toFormattedString() {
    return DateFormat('MMM d, y').format(this);
  }
}

extension StringToDateTime on String {
  // Convert a string in the format "Jul 13, 2023" to DateTime
  DateTime toDateTime() {
    return DateFormat('MMM d, y').parse(this);
  }
}
