import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/di/service_locator.dart';
import '../../domain/manager/category_manager/category_manager.dart';
import '../../domain/model/categories.dart';
import '../common/router/grow_daily_route.dart';
import '../common/toolbar/toolbar.dart';

class ChooseCategoryScreen extends StatelessWidget {
  const ChooseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryManager = serviceLocator.get<CategoryManager>();
    final categories = categoryManager.initializeCategories();
    return Scaffold(
      appBar: const Toolbar(
        title: "Explore Your Growth",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  // Generate cards with text as children
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: const Color(0xFFFFF5FA),
                      surfaceTintColor: Colors.transparent,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          categories[index].category.name,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFFFDA759),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.go(GrowDailyRoute.bottomNavigation.path);
              },
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
