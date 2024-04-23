import 'package:flutter/material.dart';

import '../../../common/constant/constant.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets contentPadding;
  final double borderRadius;
  final double elevation;

  const BaseCard(
      {super.key,
      required this.child,
      this.margin = const EdgeInsets.all(Constant.spaceLarge),
      this.contentPadding = const EdgeInsets.all(Constant.spaceLarge),
      this.borderRadius = Constant.spaceMedium,
      this.elevation = Constant.zero});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      elevation: elevation,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: contentPadding,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: double.infinity,
            minHeight: Constant.zero,
          ),
          child: IntrinsicHeight(
            child: child,
          ),
        ),
      ),
    );
  }
}
