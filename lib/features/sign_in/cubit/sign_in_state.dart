part of 'sign_in_cubit.dart';

abstract class GeneralSignInState extends Equatable {
  const GeneralSignInState();

  @override
  List<Object> get props => [];
}

abstract class SignInState extends GeneralSignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {
  SignInFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
