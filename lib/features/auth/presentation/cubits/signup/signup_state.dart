part of 'signin_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final String message;
  const SignupSuccess(this.message);
}

final class SignupError extends SignupState {
  final ApiException exception;
  const SignupError(this.exception);
}
