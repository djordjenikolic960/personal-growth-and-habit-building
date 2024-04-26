import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../data/di/service_locator.dart';
import '../../data/model/habit.dart';
import '../bloc/user_bloc/user_bloc.dart';
import '../bloc/user_bloc/user_event.dart';
import '../bloc/user_bloc/user_state.dart';
import '../common/router/grow_daily_route.dart';
import '../common/widget/background_widget.dart';
import '../common/widget/custom_list_view.dart';
import '../extensions/date_time_extension.dart';
import '../extensions/localization_extension.dart';
import '../extensions/theme_extensions.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';
import '../../common/constant/colors.dart';
import '../../common/constant/constant.dart';
import '../common/assets.dart';
import '../common/toolbar/toolbar.dart';
import '../common/widget/base_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoggedOut) {
          context.go(GrowDailyRoute.bottomNavigation.path);
        }
      },
      child: Scaffold(
        appBar: Toolbar(
          title: context.l10n.homepageTitle,
          actions: [
            InkWell(
              onTap: () {
                context.read<UserBloc>().add(LogOut());
              },
              child: const Padding(
                padding: EdgeInsets.all(Constant.spaceMedium),
                child: CircleAvatar(
                    backgroundColor: DailyGrowColors.hintColor,
                    radius: 20,
                    child: Icon(Icons.logout_outlined)),
              ),
            ),
          ],
        ),
        body: BlocProvider<HomeBloc>(
          create: (_) =>
              serviceLocator.get<HomeBloc>()..add(InitializeHabitsStream()),
          child: Stack(
            children: [
              BackgroundWidget(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                ),
              ),
              SingleChildScrollView(
                child:
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _MotivationalQuote(),
                      _DatePicker((state is FetchHabitSuccess)
                          ? state.selectedDate
                          : DateTime.now()),
                      const SizedBox(
                        height: Constant.spaceLarge,
                      ),
                      state is FetchHabitSuccess && state.habit.isNotEmpty
                          ? CustomListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              title: Text(
                                context.l10n.habits,
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              itemBuilder: (context, index) => HabitCard(
                                  habit: state.habit[index],
                                  selectedDate: state.selectedDate),
                              itemCount: state.habit.length)
                          : const SizedBox.shrink()
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(GrowDailyRoute.createHabit.path);
          },
          child: const Icon(
            Icons.add,
            color: DailyGrowColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}

class _MotivationalQuote extends StatelessWidget {
  const _MotivationalQuote();

  static const _imageScale = 1.4;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      contentPadding: const EdgeInsets.fromLTRB(
        Constant.spaceLarge,
        Constant.spaceMedium,
        Constant.spaceMedium,
        Constant.zero,
      ),
      elevation: 1.0,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Constant.spaceLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We first make our habits, \n and then our habits \n makes us.",
                  style: context.textTheme.titleMedium,
                ),
                Text(
                  "- anonymous",
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: DailyGrowColors.hintColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: Constant.zero,
            child: Image.asset(
              scale: _imageScale,
              GrowDailyAssets.motivationalContent,
            ),
          ),
        ],
      ),
    );
  }
}

class _DatePicker extends StatelessWidget {
  final DateTime selectedDate;

  const _DatePicker(this.selectedDate);

  static const _dateSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: Constant.spaceLarge),
      height: _dateSize + Constant.spaceLarge,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: Constant.numberOfDaysInAWeek,
              itemBuilder: (context, index) {
                final DateTime today =
                    DateTime.now().add(Duration(days: index));
                final isSelected = today.isSameDate(selectedDate);
                return InkWell(
                  onTap: () {
                    context.read<HomeBloc>().add(SelectDate(today));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: _dateSize,
                    height: _dateSize + Constant.spaceLarge,
                    margin: const EdgeInsets.symmetric(
                        horizontal: Constant.spaceSmall),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? DailyGrowColors.textColor : Colors.white,
                      borderRadius: BorderRadius.circular(Constant.spaceMedium),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          today.day.toString(),
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: DailyGrowColors.secondaryColor,
                          ),
                        ),
                        Text(
                          today.toDayOfWeek,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: isSelected
                                ? DailyGrowColors.secondaryColor
                                : DailyGrowColors.hintColor,
                          ),
                        ),
                      ],
                    ), // Placeholder content
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HabitCard extends StatelessWidget {
  final Habit habit;
  final DateTime selectedDate;

  const HabitCard({
    super.key,
    required this.habit,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final isChecked = habit.logs.firstWhereOrNull(
            (log) => log.date.toDate == selectedDate.toDate && log.completed) !=
        null;
    return BaseCard(
      margin: const EdgeInsets.all(Constant.spaceLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.account_circle_sharp,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: Constant.spaceMedium,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        habit.title,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      Text(habit.title, style: context.textTheme.titleSmall),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Checkbox(
                  value: isChecked,
                  onChanged: (isCompleted) {
                    context
                        .read<HomeBloc>()
                        .add(UpdateHabit(habit, isCompleted!));
                  }),
              // Custom widget to create the circular progress indicator
            ],
          ),
        ],
      ),
    );
  }
}
