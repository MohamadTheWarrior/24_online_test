import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenty_four_online_interview_test/features/authentication/bloc/authentication_bloc.dart';
import 'package:twenty_four_online_interview_test/global/router/router.gr.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    debugPrint('Authentication View disposed.');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, GeneralAuthenticationState>(
      builder: (context, state) {
        return AutoRouter.declarative(
          routes: (context) {
            return [
              if (state is AuthenticatedState) const HomeRouter(),
              if (state is UnauthenticatedState) const SignInRoute(),
            ];
          },
        );
      },
    );
  }
}
