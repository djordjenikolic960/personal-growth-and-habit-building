import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'reminder_item.dart';

import '../../../common/constant/constant.dart';

class ReminderGrid extends StatelessWidget {
  // Start time for the reminders
  final startTime = const TimeOfDay(hour: 6, minute: 0);

  ReminderGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(Constant.spaceMedium),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.3,
      ),
      itemCount: 48, // This creates a 6-hour range of reminders spaced 30 minutes apart.
      itemBuilder: (context, index) {
        final hourOffset = (startTime.minute + 30 * index) ~/ 60;
        final minute = (startTime.minute + 30 * index) % 60;
        final currentTime = startTime.replacing(hour: (startTime.hour + hourOffset) % 24, minute: minute);
        final displayTime = formatTimeOfDay(currentTime);
        // The isOn flag could be managed by state management (Bloc, etc.)
        bool isOn = false;

        return ReminderItem(
          time: displayTime,
          isOn: isOn,
        );
      },
    );
  }

  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final format = DateFormat.jm(); // This will use the local format for AM/PM.
    return format.format(dt);
  }
}
