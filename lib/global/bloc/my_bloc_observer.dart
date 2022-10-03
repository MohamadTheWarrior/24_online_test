import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenty_four_online_interview_test/main.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    10;
    logger.wtf(
      '${bloc.runtimeType}:\n$event',
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    10;
    logger.i(
      '${bloc.runtimeType}:\n${change.currentState}\n${change.nextState}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    10;
    logger.e('$error\n$stackTrace');
  }
}
