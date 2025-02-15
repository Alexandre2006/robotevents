import 'package:intl/intl.dart';

final DateFormat formatString =
    DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSSSSS+00:00");

DateTime rfc3339ToDateTime(String rfc3339) {
  return DateTime.parse(rfc3339);
}

String dateTimeToRfc3339(DateTime dateTime) {
  return formatString.format(dateTime.toUtc());
}
