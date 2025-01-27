import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_studio/config/flavors/flavor_config.dart';
import 'package:learning_studio/config/style/app_colors.dart';
// import 'package:learning_studio/firebase_options_prod.dart' as prod;
import 'package:learning_studio/main_app.dart';

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
