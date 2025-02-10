part of 'nav_auth_cubit.dart';

sealed class NavAuthState extends Equatable {
  const NavAuthState();

  @override
  List<Object> get props => [];
}

final class NavAuthInitial extends NavAuthState {}
