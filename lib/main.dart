import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'data/di/service_locator.dart';
import 'firebase_options.dart';
import 'presentation/bloc/user_bloc/user_bloc.dart';
import 'presentation/common/router/grow_daily_router.dart';
import 'presentation/di/service_locator.dart' as presentation_service_locator;
import 'presentation/themes/grow_daily_theme_data.dart';
import 'domain/di/service_locator.dart' as domain_service_locator;
import 'data/di/service_locator.dart' as data_service_locator;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init();
  runApp(const MyApp());
}

Future<void> _init() async {
  await _initFirebase();
  await _initDependencies();
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> _initDependencies() async {
  await data_service_locator.init();
  domain_service_locator.init();
  presentation_service_locator.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
        create: (_) => serviceLocator.get<UserBloc>(),
        child: MaterialApp.router(
          theme: growDailyThemeData(),
          routerConfig:
              presentation_service_locator.get<GrowDailyRouter>().getRouter(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ));
  }
}
