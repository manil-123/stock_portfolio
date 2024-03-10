import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String getDateMonth() {
    return DateFormat(' d MMM').format(toLocal());
  }
}
