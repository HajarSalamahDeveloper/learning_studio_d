import 'package:app_skeleton/config/flavors/flavor_config.dart';

abstract class ApiEndpoints {
  static final String baseUrl = FlavorConfig.instance.baseUrl;
  static const String v1 = '/v1';
  static const String login = '$v1/login';
  static const String singup = '$v1/sign-up';
  static const String verifyotp = '$v1/verify-otp';
  static const String logout = '$v1/logout';
  static const String deleteAccount = '$v1/delete-account';
  static String updateAddress(int id) => '$v1/address/update/$id';
  static String deleteAddress(int id) => '$v1/address/delete/$id';
  

}
