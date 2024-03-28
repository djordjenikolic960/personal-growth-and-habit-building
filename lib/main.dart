import 'package:flutter/material.dart';
import 'presentation/common/router/grow_daily_router.dart';
import 'presentation/di/service_locator.dart' as presentation_service_locator;
import 'presentation/themes/grow_daily_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initDependencies();
  runApp(const MyApp());
}

Future<void> _initDependencies() async {
  presentation_service_locator.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Grow Daily",
      theme: growDailyThemeData(),
      routerConfig:
          presentation_service_locator.get<GrowDailyRouter>().getRouter(),
    );
  }
}
