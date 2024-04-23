import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/constant/colors.dart';
import '../../common/constant/constant.dart';
import '../../domain/di/service_locator.dart';
import '../../domain/manager/category_manager/category_manager.dart';
import '../../domain/entity/categories.dart';
import '../common/router/grow_daily_route.dart';
import '../common/toolbar/toolbar.dart';
import '../common/widget/primary_button.dart';
import '../extensions/localization_extension.dart';
import 'bloc/choose_category_bloc.dart';
import 'bloc/choose_category_event.dart';
import 'bloc/choose_category_state.dart';

class ChooseCategoryScreen extends StatelessWidget {
  const ChooseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryManager = serviceLocator.get<CategoryManager>();
    final categories = categoryManager.initializeCategories(context);
    return Scaffold(
      appBar: Toolbar(
        title: context.l10n.chooseCategoryTitle,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Constant.spaceLarge),
          child: BlocProvider<ChooseCategoryBloc>(
            create: (_) => serviceLocator.get<ChooseCategoryBloc>(),
            child: BlocBuilder<ChooseCategoryBloc, ChooseCategoryState>(
                builder: (context, state) {
              final selectedCategories =
                  (state as CategoriesUpdated).selectedCategories;
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        final isCategorySelected =
                            selectedCategories.contains(categories[index]);
                        return GestureDetector(
                          onTap: () {
                            final category = categories[index];
                            if (selectedCategories.contains(category)) {
                              context.read<ChooseCategoryBloc>().add(
                                    CategoryDeselected(
                                      category,
                                    ),
                                  );
                            } else {
                              context.read<ChooseCategoryBloc>().add(
                                    CategorySelected(
                                      category,
                                    ),
                                  );
                            }
                          },
                          child: Card(
                            color: isCategorySelected
                                ? DailyGrowColors.textColor
                                : const Color(0xFFFFF5FA),
                            surfaceTintColor: Colors.transparent,
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                categories[index].category.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: isCategorySelected
                                      ? const Color(0xFFFFF5FA)
                                      : DailyGrowColors.textColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  PrimaryButton(
                    label: context.l10n.continueLabel,
                    onPressed: () {
                      context.read<ChooseCategoryBloc>().add(SaveCategories());
                      context.go(GrowDailyRoute.bottomNavigation.path);
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
