import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_skeleton/config/flavors/flavor_config.dart';
import 'package:app_skeleton/config/style/app_colors.dart';
// import 'package:app_skeleton/firebase_options_prod.dart' as prod;
import 'package:app_skeleton/main_app.dart';

import 'core/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(baseUrl: 'https://www.developersoptions.com', flavor: Flavor.prod);
  // await Firebase.initializeApp(options: prod.DefaultFirebaseOptions.currentPlatform);

  await init();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColor,
      systemNavigationBarColor: AppColors.secondaryColor,
  ));
  runApp(
    (const MainApp()),
  );
}
