import 'package:flutter/material.dart';

import '../../../common/constant/constant.dart';

class CustomListView extends StatelessWidget {
  final Widget title;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final ScrollController? controller;
  final Axis scrollDirection;
  final bool? primary;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final bool addAutomaticKeepAlive;

  const CustomListView({
    super.key,
    required this.title,
    required this.itemBuilder,
    required this.itemCount,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.primary,
    this.physics,
    this.padding,
    this.shrinkWrap = false,
    this.addAutomaticKeepAlive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      scrollDirection: scrollDirection,
      primary: primary,
      physics: physics,
      padding: padding,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount + 1,
      // Adding 1 for the title
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(left: Constant.spaceLarge),
            child: title,
          );
        }
        // Adjust the index for the itemBuilder by subtracting 1
        return itemBuilder(context, index - 1);
      },
      addAutomaticKeepAlives: addAutomaticKeepAlive,
    );
  }
}
