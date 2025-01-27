import 'package:learning_studio/core/di/locator.dart';
import 'package:learning_studio/core/network/api_endpoints.dart';
import 'package:learning_studio/core/network/dio_client.dart';
import 'package:learning_studio/core/services/shared_pref_services.dart';

class AuthHelper {
   static logout() async {
     sl<SharedPreferencesService>().delete('user');
     sl<DioClient>().get(ApiEndpoints.logout);
     // NavigationService.navigateAndRemoveUntil(AuthScreen.routeName);
  }
   static deleteAccount() async {
     sl<SharedPreferencesService>().delete('user');
     sl<DioClient>().delete(ApiEndpoints.deleteAccount);
     // NavigationService.navigateAndRemoveUntil(AuthScreen.routeName);
  }
}