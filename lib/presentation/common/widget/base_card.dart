import 'package:flutter/material.dart';

import '../../../common/constant/constant.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets contentPadding;
  final double borderRadius;
  final double height;

  const BaseCard({
    super.key,
    required this.child,
    this.margin = const EdgeInsets.all(Constant.spaceLarge),
    this.contentPadding = const EdgeInsets.all(Constant.spaceLarge),
    this.borderRadius = Constant.spaceMedium,
    this.height = Constant.cardDefaultHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: contentPadding,
        child: SizedBox(
          width: double.infinity,
          height: height,
          child: child,
        ),
      ),
    );
  }
}
