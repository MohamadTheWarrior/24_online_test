import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:twenty_four_online_interview_test/features/sign_in/repository/sign_in_exceptions.dart';
import 'package:twenty_four_online_interview_test/global/utils/strings.dart';

import '../repository/sign_in_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<GeneralSignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signIn() async {
    emit(SignInLoading());

    try {
      await FirebaseSignInRepository().signInAnonyoumsly();

      emit(SignInSuccess());
    } on AnonymousSignInFailure catch (e) {
      emit(SignInFailure(e.message));
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(SignInFailure(errorMessage));
    }
  }
}
