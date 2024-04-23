import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/user_bloc/user_bloc.dart';
import '../bloc/user_bloc/user_event.dart';
import '../bloc/user_bloc/user_state.dart';
import '../common/router/grow_daily_route.dart';
import '../extensions/localization_extension.dart';
import '../extensions/theme_extensions.dart';
import 'widgets/diagonal_half_painter.dart';
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
        body: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _MotivationalQuote(),
              _HabitHeading(),
              SizedBox(
                height: Constant.spaceMedium,
              ),
              _HabitRow("Read a book", DailyGrowColors.textColor),
              SizedBox(
                height: Constant.spaceMedium,
              ),
              _HabitRow("Exercise", Colors.blue),
              SizedBox(
                height: Constant.spaceMedium,
              ),
              _HabitRow("Wake Up Early", Colors.red),
              SizedBox(
                height: Constant.spaceMedium,
              ),
              _HabitRow("Walk Dog", Colors.deepPurple),
              SizedBox(
                height: 400,
              )
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
              DailyGrowAssets.motivationalContent,
            ),
          ),
        ],
      ),
    );
  }
}

class _HabitHeading extends StatelessWidget {
  const _HabitHeading();

  static const _dateSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: Constant.spaceLarge),
      height: _dateSize,
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Constant.spaceLarge),
            child: Text(
              context.l10n.habits,
              style: context.textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            width: 60,
          ),
          Expanded(
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  width: _dateSize,
                  height: _dateSize,
                  margin: const EdgeInsets.symmetric(
                      horizontal: Constant.spaceSmall),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Constant.spaceMedium),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Mon",
                        style: context.textTheme.bodySmall?.copyWith(
                          color: DailyGrowColors.hintColor,
                        ),
                      ),
                      Text(
                        "22",
                        style: context.textTheme.titleMedium,
                      ),
                    ],
                  ), // Placeholder content
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _HabitRow extends StatelessWidget {
  final String title;
  final Color color;

  const _HabitRow(
    this.title,
    this.color,
  );

  static const _dateSize = 75.0;
  static const _verticalPadding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: Constant.spaceLarge),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Constant.spaceMedium),
      ),
      height: _dateSize,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.3,
            child: Padding(
              padding: const EdgeInsets.only(left: Constant.spaceLarge),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.titleSmall,
              ),
            ),
          ),
          const SizedBox(
            width: Constant.spaceLarge,
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: DailyGrowColors.backgroundColor,
          ),
          Expanded(
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(left: _verticalPadding),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  width: 52,
                  height: 52,
                  margin: const EdgeInsets.symmetric(
                      horizontal: Constant.spaceSmall,
                      vertical: _verticalPadding),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(Constant.spaceMedium),
                  ),
                  child: index % 2 == 0
                      ? CustomPaint(
                          size: const Size(48, 46),
                          painter: DiagonalHalfPainter(color: color),
                        )
                      : Container(
                          width: 46,
                          height: 49,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius:
                                BorderRadius.circular(Constant.spaceMedium),
                          ),
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
