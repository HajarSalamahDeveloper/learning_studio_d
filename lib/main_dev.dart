import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:app_skeleton/config/flavors/flavor_config.dart';
import 'package:app_skeleton/config/style/app_colors.dart';
import 'package:app_skeleton/core/init.dart';
import 'package:app_skeleton/main_app.dart';
// import 'package:app_skeleton/firebase_options_dev.dart' as dev;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.remove();

  FlavorConfig(baseUrl: 'https://www.developersoptions.com', flavor: Flavor.dev);
    // await Firebase.initializeApp(options: dev.DefaultFirebaseOptions.currentPlatform );

  await init();
await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      systemNavigationBarColor: AppColors.secondaryColor,
       
    ),
  );
  // await FirebaseRemoteConfigService().init();
  // Logger.debug('Firebase Remote Config: ${  FirebaseRemoteConfigService().apiBaseUrl}');
  runApp(
    (const MainApp()),
  );
}
