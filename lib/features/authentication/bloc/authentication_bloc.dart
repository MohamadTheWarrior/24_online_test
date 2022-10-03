import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:twenty_four_online_interview_test/features/sign_in/models/user_model.dart';
import 'package:twenty_four_online_interview_test/features/sign_in/repository/sign_in_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, GeneralAuthenticationState> {
  AuthenticationBloc({
    required FirebaseSignInRepository signInRepository,
  })  : _signInRepository = signInRepository,
        super(
          signInRepository.firebaseAuth.currentUser != null
              ? AuthenticatedState()
              : UnauthenticatedState(),
        ) {
    debugPrint('CurrentState: $state');

    on<IsAuthenticated>(_findIfAuthenticated);
    on<SignInRequested>(_signIn);
    on<SignOutRequested>(_signOut);
    on<UserStateChanged>(_onUserChanged);

    _userSubscription = _signInRepository.user.listen(
      (user) => add(UserStateChanged(user)),
    );
  }

  final FirebaseSignInRepository _signInRepository;
  late final StreamSubscription<UserModel> _userSubscription;

  void _findIfAuthenticated(
    IsAuthenticated event,
    Emitter<GeneralAuthenticationState> emit,
  ) {
    if (_signInRepository.firebaseAuth.currentUser != null) {
      debugPrint('Zelenskyy');
      emit(AuthenticatedState());
    } else {
      emit(UnauthenticatedState());
    }
  }

  void _signIn(
    SignInRequested event,
    Emitter<GeneralAuthenticationState> emit,
  ) async {
    emit(AuthenticatedState());
  }

  void _signOut(
    SignOutRequested event,
    Emitter<GeneralAuthenticationState> emit,
  ) async {
    emit(UnauthenticatedState());
  }

  void _onUserChanged(
    UserStateChanged event,
    Emitter<GeneralAuthenticationState> emit,
  ) {
    debugPrint('Is user empty: ${event.user.isEmpty}');
    emit(
      event.user.isEmpty ? UnauthenticatedState() : AuthenticatedState(),
    );
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
