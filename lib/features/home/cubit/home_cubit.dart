import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:twenty_four_online_interview_test/features/home/models/wish_model.dart';
import 'package:twenty_four_online_interview_test/features/home/repository/home_repository.dart';
import 'package:twenty_four_online_interview_test/features/sign_in/repository/sign_in_exceptions.dart';
import 'package:twenty_four_online_interview_test/features/sign_in/repository/sign_in_repository.dart';
import 'package:twenty_four_online_interview_test/global/utils/strings.dart';

part 'home_state.dart';
part 'sign_out_state.dart';
part 'add_or_edit_wish_state.dart';
part 'get_all_wishs_state.dart';
part 'delete_wish_state.dart';

enum AddOrEditWishType { add, edit }

class HomeCubit extends Cubit<GeneralHomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial()) {
    _wishsSubscription = homeRepository.wishs.listen(
      (wishs) => getAllWishs(wishs),
    );
  }

  final IHomeRepository homeRepository;
  late final StreamSubscription<List<WishModel>> _wishsSubscription;

  Future<void> getAllWishs(List<WishModel> wishs) async {
    emit(GetAllWishsSuccess(wishs));
  }

  Future<void> addWish(WishModel wish) async {
    emit(AddOrEditWishLoading());

    if (wish.title.isEmpty) {
      emit(AddOrEditWishFailure("Title shouldn't be empty"));
      return;
    }

    try {
      final documentReference = await homeRepository.addWish(wish);
      wish.id = documentReference.id;
      emit(AddOrEditWishSuccess(wish));
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(AddOrEditWishFailure(errorMessage));
    }
  }

  Future<void> editWish(WishModel wish) async {
    emit(AddOrEditWishLoading());

    if (wish.title.isEmpty) {
      emit(AddOrEditWishFailure("Title shouldn't be empty"));
      return;
    }

    try {
      await homeRepository.editWish(wish);
      emit(AddOrEditWishSuccess(wish));
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(AddOrEditWishFailure(errorMessage));
    }
  }

  Future<void> deleteWish(WishModel wish) async {
    emit(DeleteWishLoading());

    try {
      await homeRepository.deleteWish(wish);
      emit(DeleteWishSuccess(wish));
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(DeleteWishFailure(errorMessage));
    }
  }

  Future<void> signOut() async {
    emit(SignOutLoading());

    try {
      await FirebaseSignInRepository().signOut();

      emit(SignOutSuccess());
    } on AnonymousSignOutFailure catch (e) {
      emit(SignOutFailure(e.message));
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(SignOutFailure(errorMessage));
    }
  }

  @override
  Future<void> close() {
    _wishsSubscription.cancel();
    return super.close();
  }
}
