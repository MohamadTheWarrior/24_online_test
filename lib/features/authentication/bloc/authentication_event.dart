part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class IsAuthenticated extends AuthenticationEvent {}

class SignInRequested extends AuthenticationEvent {}

class SignOutRequested extends AuthenticationEvent {}

class UserStateChanged extends AuthenticationEvent {
  const UserStateChanged(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}
