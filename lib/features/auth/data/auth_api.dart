import 'package:app_skeleton/core/network/api_endpoints.dart';
import 'package:app_skeleton/core/network/dio_client.dart';
import 'package:app_skeleton/core/network/result.dart';
import 'package:app_skeleton/features/auth/data/models/sign_up_model.dart';

class AuthApi {
  final DioClient _client;
  AuthApi(this._client);

  Future<Result> login(String phoneNo) {
    return _client.post(ApiEndpoints.login, data: {'phone': phoneNo});
  }

  Future<Result> signup(SignUpModel data) {
    return _client.post(ApiEndpoints.singup, data: data.toJson());
  }

  Future<Result> verify(String phoneNo, String otp,String? fcm) {
    return _client.post(ApiEndpoints.verifyotp, data: {'phone': phoneNo, 'otp': otp,'fcm_token':fcm});
  }
 
 
}
