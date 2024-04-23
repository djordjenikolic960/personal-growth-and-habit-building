import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../common/widget/text_input_field/text_input_field.dart';

import '../../common/constant/colors.dart';
import '../../common/constant/constant.dart';
import '../common/assets.dart';
import '../common/toolbar/toolbar.dart';
import '../common/widget/base_card.dart';
import '../extensions/localization_extension.dart';
import '../extensions/theme_extensions.dart';
import '../home/widgets/diagonal_half_painter.dart';

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
      body: Padding(
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
                    borderRadius: BorderRadius.circular(Constant.spaceMedium),
                  ),
                  child: SvgPicture.asset(
                    DailyGrowAssets.book,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            7,
                            (index) => _DayIndicator(
                                index: index,
                                color: DailyGrowColors.textColor)),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: Constant.spaceLarge,
            ),
            BaseCard(
              margin: const EdgeInsets.all(
                Constant.zero,
              ),
              child: Row(
                children: [
                  Text(
                    "Reminder",
                    style: context.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const Spacer(),
            BaseCard(
                child: Column(
              children: [
                Text("Start This Habit", style: context.textTheme.titleLarge),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class _DayIndicator extends StatelessWidget {
  final int index;
  final Color color;

  const _DayIndicator({
    required this.index,
    required this.color,
  });

  static const _verticalPadding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"][index],
        ),
        const SizedBox(height: Constant.spaceMedium),
        Container(
          alignment: Alignment.center,
          width: 36,
          height: 36,
          margin: const EdgeInsets.symmetric(
              horizontal: Constant.spaceSmall, vertical: _verticalPadding),
          decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(Constant.spaceMedium),
          ),
          child: index % 2 == 0
              ? CustomPaint(
                  size: const Size(32, 30),
                  painter: DiagonalHalfPainter(color: color),
                )
              : Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(Constant.spaceMedium),
                  ),
                ),
        )
      ],
    );
  }
}
