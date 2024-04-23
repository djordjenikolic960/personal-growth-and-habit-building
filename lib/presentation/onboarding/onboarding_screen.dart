import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../common/router/grow_daily_route.dart';
import '../common/widget/primary_button.dart';
import '../extensions/localization_extension.dart';
import '../extensions/theme_extensions.dart';
import 'bloc/onboarding_event.dart';
import 'bloc/onboarding_state.dart';
import '../../common/constant/constant.dart';
import '../common/assets.dart';
import '../di/service_locator.dart';
import 'bloc/onboarding_bloc.dart';
import 'widget/page_indicator.dart';

import 'widget/onboarding_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    /// not creating manager for this since this content is static and it will not be fetched from some remote api
    final onboardingPages = [
      OnboardingContent(
        title: context.l10n.onBoardingScreen1Title,
        body: context.l10n.onBoardingScreen1Body,
        image: Image.asset(DailyGrowAssets.onboardingContent1),
      ),
      OnboardingContent(
        title: context.l10n.onBoardingScreen2Title,
        body: context.l10n.onBoardingScreen2Body,
        image: Image.asset(DailyGrowAssets.onboardingContent2),
      ),
      OnboardingContent(
        title: context.l10n.onBoardingScreen3Title,
        body: context.l10n.onBoardingScreen3Body,
        image: Image.asset(DailyGrowAssets.onboardingContent3),
      ),
      OnboardingContent(
        title: context.l10n.onBoardingScreen4Title,
        body: context.l10n.onBoardingScreen4Body,
        image: Image.asset(DailyGrowAssets.onboardingContent4),
      ),
    ];

    final pageCount = onboardingPages.length;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider<OnBoardingBloc>(
          create: (context) => serviceLocator.get<OnBoardingBloc>(),
          child: BlocConsumer<OnBoardingBloc, OnBoardingState>(
            listener: (context, state) {
              if (state is OnGetStarted) {
                context.go(GrowDailyRoute.logIn.path);
              }
            },
            listenWhen: (_, state) => state is OnGetStarted,
            buildWhen: (_, state) => state is! OnGetStarted,
            builder: (context, state) {
              if (state is PageChanged) {
                final page = (state).page;
                final isLastPage = page == pageCount - 1;
                if (_pageController.hasClients &&
                    _pageController.page!.round() != page) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        children: onboardingPages,
                        onPageChanged: (page) {
                          context
                              .read<OnBoardingBloc>()
                              .add(OnPageChange(page));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constant.spaceJumbo),
                      child: isLastPage
                          ? PrimaryButton(
                              label: context.l10n.getStarted,
                              onPressed: () {
                                context
                                    .read<OnBoardingBloc>()
                                    .add(GetStarted());
                              })
                          : Row(
                              children: [
                                InkWell(
                                  onTap: () =>
                                      _pageController.jumpToPage(pageCount - 1),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Constant.spaceMedium,
                                      vertical: Constant.spaceSmall,
                                    ),
                                    child: Text(
                                      context.l10n.skip,
                                      style: context.textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Center(
                                  child: PageIndicator(
                                    current: page,
                                    total: pageCount,
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () => context
                                      .read<OnBoardingBloc>()
                                      .add(OnPageChange(
                                          _pageController.page!.toInt() + 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Constant.spaceMedium,
                                      vertical: Constant.spaceSmall,
                                    ),
                                    child: Text(
                                      context.l10n.next,
                                      style: context.textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
