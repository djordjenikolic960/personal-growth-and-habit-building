import 'package:flutter/material.dart';

import '../common/toolbar/toolbar.dart';

class CreateHabitScreen extends StatelessWidget {
  const CreateHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Toolbar(title: "New Habit"),
      body: Column(
        children: [],
      ),
    );
  }
}
