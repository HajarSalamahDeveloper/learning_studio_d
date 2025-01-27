import 'package:learning_studio/config/localizaion/localization_service.dart';
import 'package:learning_studio/core/di/locator.dart';

init() async {
  await setUpLocator( );
  await LocalizationService.initialize();


  // await FCMService.initializeFCM();
  // await sl<FirebaseRemoteConfigService>().initialize();
 }
