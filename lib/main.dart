import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tap_assignment_sherif/constant/constant_values.dart';
import 'package:tap_assignment_sherif/constant/themes.dart';
import 'package:tap_assignment_sherif/init_route.dart';
import 'package:tap_assignment_sherif/providers/add_product_provider.dart';
import 'package:tap_assignment_sherif/providers/product_list_provider.dart';
import 'package:tap_assignment_sherif/ui_components/pages/add_product.dart';
import 'package:tap_assignment_sherif/ui_components/pages/products_list.dart';
import 'package:tap_assignment_sherif/utils/connectivity.dart';
import 'package:tap_assignment_sherif/utils/firebase_configuration.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFlutterFire();
  runZonedGuarded(() {
    runApp(MultiProvider(providers: [
      StreamProvider<ConnectivityResult>(
        initialData: ConnectivityResult.wifi,
        create: (context) =>
            ConnectivityService().connectionStatusController.stream,
      ),
      ChangeNotifierProvider<AddProductProvider>(
        create: (context) => AddProductProvider(),
      ),
      ChangeNotifierProvider<ProductListProvider>(
        create: (context) => ProductListProvider(),
      ),
    ], child: const MyApp()));
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale(LocaleConstants.englishLocale, ''),
        ],
        locale: const Locale(LocaleConstants.englishLocale, ''),
        // themeMode depend on system mode {ThemeMode.system} "default value"
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        routes: {
          '/': (context) => const AppInitRoute(),
          '/ProductsListPage': (context) => const ProductsListPage(),
          '/AddProductPage': (context) => const AddProductPage(),
        },
        initialRoute: '/');
  }
}
