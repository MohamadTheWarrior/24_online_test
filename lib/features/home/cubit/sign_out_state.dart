part of 'home_cubit.dart';

abstract class SignOutState extends GeneralHomeState {}

class SignOutInitial extends SignOutState {}

class SignOutSuccess extends SignOutState {}

class SignOutLoading extends SignOutState {}

class SignOutFailure extends SignOutState {
  SignOutFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
