import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:visual_note_app_task/view/pages/home_page.dart';

import 'app_bindings.dart';
import 'constants.dart';
import 'utils/langs/my_translation.dart';
import 'view/pages/animated_splash.dart';

Future<void> main() async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: kPrimaryColor // status bar color
          ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final bool isEnglish = GetStorage().read('language') ?? true;

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // this for alice debugging network calls
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Visual Note App',
      translations: MyTranslation(),
      // change theme from darkmode default value app setting controller
      locale: isEnglish ? const Locale('en', 'US') : const Locale('ar', 'EG'),
      initialBinding: AppBinding(),
      home: AnimatedSplash(
        imagePath: 'assets/images/logo.png',
        home: const HomePage(),
        duration: 1400,
        type: AnimatedSplashType.StaticDuration,
      ),
    );
  }
}
