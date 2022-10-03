import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenty_four_online_interview_test/features/add_or_edit_wish/view/widgets/wish_tile.dart';
import 'package:twenty_four_online_interview_test/features/home/cubit/home_cubit.dart';
import 'package:twenty_four_online_interview_test/features/home/repository/home_repository.dart';
import 'package:twenty_four_online_interview_test/global/router/router.gr.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        FirebaseHomeRepository(),
      ),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add_rounded),
      onPressed: () {
        context.router.push(
          AddOrEditWishRoute(
            homeCubit: context.read<HomeCubit>(),
          ),
        );
      },
    );
  }

  Widget buildBody() {
    return BlocBuilder<HomeCubit, GeneralHomeState>(
      buildWhen: (previous, current) => current is GetAllWishsState,
      builder: (context, state) {
        if (state is GetAllWishsSuccess) {
          if (state.wishs.isEmpty) {
            return Center(
              child: Text(
                'No wishs found',
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.wishs.length,
            itemBuilder: (context, index) {
              return WishTile(
                wish: state.wishs[index],
                onTap: () {
                  context.router.push(
                    AddOrEditWishRoute(
                      homeCubit: context.read<HomeCubit>(),
                      wish: state.wishs[index],
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
          );
        } else if (state is GetAllWishsFailure) {
          return Center(
            child: Text(state.message),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Wish List'),
      actions: [
        BlocConsumer<HomeCubit, GeneralHomeState>(
          listener: (context, state) {
            if (state is SignOutFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          buildWhen: (previous, current) => current is SignOutState,
          builder: (context, state) {
            if (state is SignOutLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<HomeCubit>().signOut();
                },
                child: const Icon(Icons.logout_rounded),
              ),
            );
          },
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
