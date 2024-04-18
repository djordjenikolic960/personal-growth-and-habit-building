import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'presentation/common/router/grow_daily_router.dart';
import 'presentation/di/service_locator.dart' as presentation_service_locator;
import 'presentation/themes/grow_daily_theme_data.dart';
import 'domain/di/service_locator.dart' as domain_service_locator;
import 'data/di/service_locator.dart' as data_service_locator;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _initDependencies();
  runApp(const MyApp());
}

Future<void> _initDependencies() async {
  data_service_locator.init();
  domain_service_locator.init();
  presentation_service_locator.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: growDailyThemeData(),
      routerConfig:
          presentation_service_locator.get<GrowDailyRouter>().getRouter(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
