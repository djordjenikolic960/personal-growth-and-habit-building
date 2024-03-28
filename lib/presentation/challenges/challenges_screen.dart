import 'package:flutter/material.dart';

import '../common/toolbar/toolbar.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Toolbar(
        title: "Challenges",
      ),
    );
  }
}
