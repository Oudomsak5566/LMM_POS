import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lmm_pos/splash_screen.dart';
import 'package:lmm_pos/utils/blindings/initial_binding.dart';
import 'package:lmm_pos/utils/routes/routing.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  runApp(EasyLocalization(
      path: 'assets/locales',
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('lo'),
      ],
      fallbackLocale: const Locale('lo'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        getPages: RoutingApp.routes,
      );
    });
  }
}
