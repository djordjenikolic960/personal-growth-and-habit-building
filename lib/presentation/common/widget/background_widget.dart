import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../assets.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(GrowDailyAssets.background),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
