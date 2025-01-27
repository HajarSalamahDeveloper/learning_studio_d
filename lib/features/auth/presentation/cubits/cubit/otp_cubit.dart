import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_studio/core/network/api_exception.dart';
import 'package:learning_studio/features/auth/data/repo/auth_repo.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final AuthRepo _repo;
  static OtpCubit get(context) => BlocProvider.of(context);
  OtpCubit(this._repo) : super(OtpInitial());

  verify(String phoneNo, String otp) async {
    emit(OtpLoading());
    final result = await _repo.verify(phoneNo, otp);
    result.fold(
      onSuccess: (data) {
       
        emit(
        OtpSuccess(),
      );
      },
      onFailure: (error) => emit(OtpError(exception: error)),
    );
  }
}
