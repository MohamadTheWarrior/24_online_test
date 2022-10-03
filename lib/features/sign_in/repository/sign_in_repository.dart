import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twenty_four_online_interview_test/features/sign_in/models/user_model.dart';
import 'package:twenty_four_online_interview_test/features/sign_in/repository/sign_in_exceptions.dart';

abstract class ISignInRepository {
  Stream<UserModel> get user;
  Future<void> signInAnonyoumsly();
  Future<void> signOut();
}

class FirebaseSignInRepository implements ISignInRepository {
  FirebaseSignInRepository._();

  static final _instance = FirebaseSignInRepository._();

  factory FirebaseSignInRepository() {
    return _instance;
  }

  final firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  @override
  Stream<UserModel> get user {
    return firebaseAuth.authStateChanges().map(
      (firebaseUser) {
        final user = firebaseUser == null ? UserModel.empty : firebaseUser.toUser;
        return user;
      },
    );
  }

  @override
  Future<void> signInAnonyoumsly() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      throw AnonymousSignInFailure.fromCode(e.code);
    } catch (_) {
      throw const AnonymousSignInFailure();
    }
  }

  @override
  Future<void> signOut() async {
    try {} catch (_) {
      throw const AnonymousSignOutFailure();
    }

    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AnonymousSignOutFailure.fromCode(e.code);
    } catch (_) {
      throw const AnonymousSignInFailure();
    }
  }
}

extension on firebase_auth.User {
  UserModel get toUser {
    return UserModel(id: uid);
  }
}
