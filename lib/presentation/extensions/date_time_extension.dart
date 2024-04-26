import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  // Get the day of the week in 'EEE' format, e.g., Mon, Tue, etc.
  String get toDayOfWeek {
    return DateFormat("EEE").format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  DateTime get toDate => DateTime(year, month, day);

  List<String> getWeekdayLabels() {
    return List.generate(7, (index) {
      // Generate a DateTime for each day of the week starting from this date
      DateTime weekDay = add(Duration(days: index - weekday + 1));
      // Format it to get a single letter representing the day of the week
      return DateFormat('E')
          .format(weekDay)[0]; // 'E' for weekday name, single letter
    });
  }
}
