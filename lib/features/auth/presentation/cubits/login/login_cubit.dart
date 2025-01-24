import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_skeleton/core/di/locator.dart';
import 'package:app_skeleton/core/network/api_exception.dart';
import 'package:app_skeleton/core/services/shared_pref_services.dart';
import 'package:app_skeleton/features/auth/data/repo/auth_repo.dart';
 
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _repo;
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginCubit(this._repo) : super(LoginInitial());
  final TextEditingController phoneCTR = TextEditingController();

  login(String phoneNo) async {
    emit(LoginLoading());
    final result = await _repo.login(phoneNo);
    result.fold(
      onSuccess: (data) => emit(
        LoginSuccess(),
      ),
      onFailure: (error) {
        emit(LoginError(exception: error));
      },
    );
  }

  logout() async {
    sl<SharedPreferencesService>().delete('user');
    //  sl<DioClient>().get(ApiEndpoints.logout);
     emit(Logout());
  }
}
