import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:learning_studio/config/flavors/flavor_config.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/core/init.dart';
import 'package:learning_studio/main_app.dart';
// import 'package:learning_studio/firebase_options_dev.dart' as dev;

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
