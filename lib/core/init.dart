import 'package:app_skeleton/config/localizaion/localization_service.dart';
import 'package:app_skeleton/core/di/locator.dart';

init() async {
  await setUpLocator( );
  await LocalizationService.initialize();


  // await FCMService.initializeFCM();
  // await sl<FirebaseRemoteConfigService>().initialize();
 }
