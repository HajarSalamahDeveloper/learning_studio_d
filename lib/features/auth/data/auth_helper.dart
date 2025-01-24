import 'package:app_skeleton/core/di/locator.dart';
import 'package:app_skeleton/core/network/api_endpoints.dart';
import 'package:app_skeleton/core/network/dio_client.dart';
import 'package:app_skeleton/core/services/shared_pref_services.dart';

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