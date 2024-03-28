import 'package:flutter/material.dart';
import '../common/toolbar/toolbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Toolbar(
        title: "Home",
      ),
    );
  }
}
