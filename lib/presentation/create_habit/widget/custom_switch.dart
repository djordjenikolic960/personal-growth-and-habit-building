import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../../../common/constant/colors.dart';
import '../../extensions/theme_extensions.dart';

class CustomSwitch extends StatelessWidget {
  final bool isOn;
  final ValueNotifier<bool> controller;

  const CustomSwitch({
    super.key,
    required this.isOn,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      controller: controller,
      inactiveColor: DailyGrowColors.hintColor,
      activeColor: DailyGrowColors.textColor.withOpacity(0.8),
      thumb: Container(
        margin: const EdgeInsets.all(2),
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color:
              isOn ? DailyGrowColors.textColor : DailyGrowColors.secondaryColor,
        ),
      ),
      disabledOpacity: 1,
      activeChild: Container(
        margin: const EdgeInsets.only(left: 4, bottom: 2),
        child: Text("On",
            style: context.textTheme.bodySmall
                ?.copyWith(color: DailyGrowColors.textColor, fontSize: 13)),
      ),
      inactiveChild: Container(
        margin: const EdgeInsets.only(right: 4, bottom: 2),
        child: Text("Off",
            style: context.textTheme.bodySmall?.copyWith(
                color: DailyGrowColors.secondaryColor, fontSize: 13)),
      ),
      width: 54,
      height: 30,
    );
  }
}
