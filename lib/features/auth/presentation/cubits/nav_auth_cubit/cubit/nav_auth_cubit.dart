import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_auth_state.dart';

class NavAuthCubit  extends Cubit<bool> {
  NavAuthCubit() : super(true);
  void toggleAuthType() {
    emit(!state); // Toggle between login and sign-up
  }
}
