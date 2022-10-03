import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:twenty_four_online_interview_test/app.dart';
import 'package:twenty_four_online_interview_test/global/bloc/my_bloc_observer.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // final authenticationRepository = SignInRepository();
  // await authenticationRepository.user.first;

  BlocOverrides.runZoned(
    () => runApp(
      const AppView(),
    ),
    blocObserver: MyBlocObserver(),
  );
}
