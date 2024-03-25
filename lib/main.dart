import 'package:flutter/material.dart';
import 'presentation/common/router/grow_daily_router.dart';
import 'presentation/di/service_locator.dart' as presentation_service_locator;

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig:
          presentation_service_locator.get<GrowDailyRouter>().getRouter(),
    );
  }
}
