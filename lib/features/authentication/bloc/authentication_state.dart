part of 'authentication_bloc.dart';

abstract class GeneralAuthenticationState extends Equatable {
  const GeneralAuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticatedState extends GeneralAuthenticationState {}

class UnauthenticatedState extends GeneralAuthenticationState {}
