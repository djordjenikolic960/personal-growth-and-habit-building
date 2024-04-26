import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../common/widget/background_widget.dart';
import '../common/widget/primary_button.dart';
import '../common/widget/text_input_field/text_input_field.dart';

import '../../common/constant/colors.dart';
import '../../common/constant/constant.dart';
import '../common/assets.dart';
import '../common/toolbar/toolbar.dart';
import '../common/widget/base_card.dart';
import '../extensions/localization_extension.dart';
import '../extensions/theme_extensions.dart';
import 'bloc/create_habit_bloc.dart';
import 'bloc/create_habit_event.dart';
import 'bloc/create_habit_state.dart';
import 'widget/reminder_grid.dart';
import 'widget/weekday_selector.dart';

class CreateHabitScreen extends StatefulWidget {
  const CreateHabitScreen({super.key});

  @override
  State<CreateHabitScreen> createState() => _CreateHabitScreenState();
}

class _CreateHabitScreenState extends State<CreateHabitScreen> {
  final habitNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title: context.l10n.new_habit),
      body:
          BlocConsumer<CreateHabitBloc, CreateHabitState>(listener: (_, state) {
        if (state is CreateHabitSuccessful) {
          context.pop();
        }
      }, builder: (context, state) {
        final habit = context.read<CreateHabitBloc>().currentHabit;
        return BackgroundWidget(
          child: Padding(
            padding: const EdgeInsets.all(
              Constant.spaceLarge,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      height: 50,
                      child: TextInputField(
                        controller: habitNameController,
                        hintText: context.l10n.new_habit_hint,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Constant.spaceMedium),
                      ),
                      child: SvgPicture.asset(
                        GrowDailyAssets.book,
                        width: 18,
                        height: 18,
                        fit: BoxFit.scaleDown,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: Constant.spaceLarge,
                ),
                BaseCard(
                    contentPadding: const EdgeInsets.all(
                      Constant.zero,
                    ),
                    margin: const EdgeInsets.all(
                      Constant.zero,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(Constant.spaceLarge),
                          child: Text(
                            "Habit frequency",
                            style: context.textTheme.titleMedium,
                          ),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        const SizedBox(
                          height: Constant.spaceMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Constant.spaceLarge),
                          child: WeekdaySelector(habit: habit),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: Constant.spaceLarge,
                ),
                GestureDetector(
                  onTap: () {
                    _showRemindersBottomSheet(context);
                  },
                  child: BaseCard(
                    margin: const EdgeInsets.all(
                      Constant.zero,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Reminder",
                          style: context.textTheme.titleMedium,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            //todo show bottom modal sheet to choose time
                          },
                          child: Row(
                            children: [
                              Text(
                                "Add",
                                style: context.textTheme.titleMedium?.copyWith(
                                    color: DailyGrowColors.textColor),
                              ),
                              const SizedBox(width: Constant.spaceSmall),
                              const Icon(
                                Icons.add,
                                color: DailyGrowColors.textColor,
                                size: 16,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 35),
                      child: BaseCard(
                          margin: const EdgeInsets.all(
                            Constant.zero,
                          ),
                          contentPadding: const EdgeInsets.fromLTRB(
                            Constant.spaceExtraLarge,
                            50,
                            Constant.spaceExtraLarge,
                            Constant.spaceLarge,
                          ),
                          child: Column(
                            children: [
                              Text("Start This Habit",
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.titleLarge),
                              const SizedBox(height: Constant.spaceMedium),
                              Text(
                                "Kickstart positive change! Commit to this simple daily action to boost your well-being and unlock new potential. Let's begin!",
                                style: context.textTheme.titleSmall,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: Constant.spaceLarge),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 2 * Constant.spaceJumbo),
                                child: PrimaryButton(
                                    label: "Start",
                                    onPressed: () {
                                      context.read<CreateHabitBloc>().add(
                                          UpdateHabit(
                                              title: habitNameController.text));
                                      context
                                          .read<CreateHabitBloc>()
                                          .add(SaveHabit());
                                    }),
                              ),
                            ],
                          )),
                    ),
                    Image.asset(
                      GrowDailyAssets.startHabit,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  void _showRemindersBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 500, // You can adjust the height as needed
          child: ReminderGrid(),
        );
      },
    );
  }
}
