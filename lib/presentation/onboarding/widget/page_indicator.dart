import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/constant.dart';
import '../../extensions/theme_extensions.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.current,
    required this.total,
    super.key,
  });

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = Constant.zero; i < total; i++)
          Container(
            width: i == current
                ? Constant.spaceMedium + Constant.spaceSmall
                : Constant.spaceMedium,
            height: i == current
                ? Constant.spaceMedium + Constant.spaceSmall
                : Constant.spaceMedium,
            margin: const EdgeInsets.symmetric(
              horizontal: Constant.spaceSmall,
            ),
            decoration: BoxDecoration(
              color: i == current
                  ? context.colorScheme.secondary
                  : DailyGrowColors.textColor,
              borderRadius: BorderRadius.circular(
                Constant.spaceMedium,
              ),
            ),
          ),
      ],
    );
  }
}
