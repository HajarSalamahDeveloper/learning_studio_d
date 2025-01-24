part of 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthApi _api;
  AuthRepoImpl(this._api);
  @override
  Future<Result> login(String phoneNo) async {
    final result = await _api.login(phoneNo);
    return result.fold(
      onSuccess: (data) async {
        try {
          final response = ResponseModel.fromJson(data);
          Logger(response.result);
          UserModel user = UserModel.fromJson(response.result);
          // user.saveToSharedPreferences();
          return Result.success(user);
        } catch (e) {
          return Result.failure(ApiException(message: e.toString()));
        }
      },
      onFailure: (error) {
        Logger.error(error.message);
        return Result.failure(error);
      },
    );
  }

  @override
  Future<Result<String?>> signup(SignUpModel data) async {
    final result = await _api.signup(data);
    return result.fold(onSuccess: (data) async {
      ResponseModel responseModel = ResponseModel.fromJson(data);
      return Result.success(responseModel.message);
    }, onFailure: (error) {
      Logger.error(error.message);
      return Result.failure(error);
    });
  }

  @override
  Future<Result> verify(String phoneNo, String otp) async {
    final fcm=await FirebaseMessaging.instance.getToken();
    final result = await _api.verify(phoneNo, otp,fcm);
    return result.fold(
      onSuccess: (data) async {
        try {
          final response = ResponseModel.fromJson(data);
          UserModel user = UserModel.fromJson(response.result);
          user.saveToSharedPreferences();
          return Result.success(user);
        } catch (e) {
          return Result.failure(ApiException(message: e.toString()));
        }
      },
      onFailure: (error) {
        Logger.error(error.message);
        return Result.failure(error);
      },
    );
  }
  
 }
