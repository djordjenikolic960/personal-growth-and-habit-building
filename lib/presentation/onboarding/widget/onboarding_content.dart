import 'package:flutter/material.dart';

import '../../../common/constant/constant.dart';
import '../../extensions/theme_extensions.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    required this.title,
    required this.image,
    required this.body,
    super.key,
  });

  final String title;
  final Widget image;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constant.spaceJumbo),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: Constant.spaceJumbo),
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          AspectRatio(
            aspectRatio: 1,
            child: image,
          ),
          const Spacer(),
          Text(
            body.toUpperCase(),
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: Constant.spaceJumbo),
        ],
      ),
    );
  }
}
