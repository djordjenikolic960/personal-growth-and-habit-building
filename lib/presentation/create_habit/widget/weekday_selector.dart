import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/constant.dart';
import '../../../data/model/habit.dart';
import '../../extensions/date_time_extension.dart';
import '../../extensions/theme_extensions.dart';
import '../bloc/create_habit_bloc.dart';
import '../bloc/create_habit_event.dart';

class WeekdaySelector extends StatelessWidget {
  final Habit habit;

  const WeekdaySelector({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    List<String> weekdayLabels = DateTime.now().getWeekdayLabels();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(habit.daysOfWeek.length, (index) {
        return GestureDetector(
          onTap: () {
            List<bool> updatedDays = List.from(habit.daysOfWeek);
            updatedDays[index] = !updatedDays[index];
            // Dispatch an update event to the Bloc
            context
                .read<CreateHabitBloc>()
                .add(UpdateHabit(daysOfWeek: updatedDays));
          },
          child: DayBox(
            day: weekdayLabels[index],
            isSelected: habit.daysOfWeek[index],
          ),
        );
      }),
    );
  }
}

class DayBox extends StatelessWidget {
  final String day;
  final bool isSelected;

  const DayBox({super.key, required this.day, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.sizeOf(context).width -
            2 * Constant.spaceJumbo -
            Constant.numberOfDaysInAWeek * Constant.spaceMedium) /
        Constant.numberOfDaysInAWeek;
    return Container(
      alignment: Alignment.center,
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: isSelected ? DailyGrowColors.textColor : Colors.white,
        border: Border.all(
            color: isSelected
                ? DailyGrowColors.textColor
                : DailyGrowColors.hintColor),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Constant.spaceMedium),
        child: Text(
          day,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: DailyGrowColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
