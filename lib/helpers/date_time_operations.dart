import 'package:intl/intl.dart';

class DateTimeOperations {
  static String getFormattedDateTime(DateTime dateTime) =>
      DateFormat('dd-MM-yyyy hh:mm a').format(dateTime);
}
