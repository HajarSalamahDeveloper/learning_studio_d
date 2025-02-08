import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_studio/core/network/api_exception.dart';
import 'package:learning_studio/core/network/result.dart';
import 'package:learning_studio/features/auth/data/models/sign_up_model.dart';
import 'package:learning_studio/features/auth/data/repo/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo _rep;
  static SignupCubit get(context) => BlocProvider.of(context);
  SignupCubit(this._rep) : super(SignupInitial());
 final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();  
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  Future<void> signup(SignUpModel data) async {
    emit(SignupLoading());
    Result result = await _rep.signup(data);
    result.fold(onSuccess: (data) {
      emit(SignupSuccess(data));
    }, onFailure: (error) {
      emit(SignupError(error));
    });
  }
}
