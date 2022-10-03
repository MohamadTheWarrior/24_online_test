import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenty_four_online_interview_test/features/sign_in/cubit/sign_in_cubit.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(),
      child: const SignInPage(),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return BlocConsumer<SignInCubit, GeneralSignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      buildWhen: (previous, current) => current is SignInState,
      builder: (context, state) {
        if (state is SignInSuccess) {
          return const SizedBox();
        } else if (state is SignInLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: ElevatedButton(
            onPressed: () {
              context.read<SignInCubit>().signIn();
            },
            child: const Text('Sign In'),
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Wish List'),
    );
  }
}
