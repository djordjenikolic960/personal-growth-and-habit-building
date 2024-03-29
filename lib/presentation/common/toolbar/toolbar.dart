import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const Toolbar({
    super.key,
    required this.title,
  });

  static const _toolbarHeight = 56.0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_toolbarHeight);
}
