import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenty_four_online_interview_test/features/authentication/bloc/authentication_bloc.dart';
import 'package:twenty_four_online_interview_test/features/sign_in/repository/sign_in_repository.dart';
import 'package:twenty_four_online_interview_test/global/router/router.gr.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationBloc(
        signInRepository: FirebaseSignInRepository(),
      ),
      child: const AppPage(),
    );
  }
}

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Wish List',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
