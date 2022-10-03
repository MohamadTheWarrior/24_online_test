import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenty_four_online_interview_test/features/home/cubit/home_cubit.dart';
import 'package:twenty_four_online_interview_test/features/home/models/wish_model.dart';

class AddOrEditWishView extends StatelessWidget {
  const AddOrEditWishView({
    Key? key,
    required this.homeCubit,
    this.wish,
  }) : super(key: key);

  final HomeCubit homeCubit;
  final WishModel? wish;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeCubit,
      child: AddOrEditWishPage(wish: wish),
    );
  }
}

class AddOrEditWishPage extends StatefulWidget {
  const AddOrEditWishPage({
    Key? key,
    this.wish,
  }) : super(key: key);

  final WishModel? wish;

  @override
  State<AddOrEditWishPage> createState() => _AddOrEditWishPageState();
}

class _AddOrEditWishPageState extends State<AddOrEditWishPage> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    if (widget.wish != null) {
      textEditingController.text = widget.wish!.title;
    }

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Future.delayed(const Duration(milliseconds: 250)).then(
          (value) => focusNode.requestFocus(),
        );
      },
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: textEditingController,
            focusNode: focusNode,
          ),
          const Spacer(),
          BlocConsumer<HomeCubit, GeneralHomeState>(
            listener: (context, state) async {
              if (state is AddOrEditWishSuccess || state is DeleteWishSuccess) {
                FocusManager.instance.primaryFocus?.unfocus();
                await Future.delayed(const Duration(milliseconds: 200));
                context.router.pop();
              } else if (state is AddOrEditWishFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              } else if (state is DeleteWishFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            buildWhen: (previous, current) =>
                current is AddOrEditWishState || current is DeleteWishState,
            builder: (context, state) {
              if (state is AddOrEditWishLoading || state is DeleteWishLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ElevatedButton(
                onPressed: () {
                  if (widget.wish != null) {
                    context.read<HomeCubit>().editWish(
                          widget.wish!.copyWith(
                            title: textEditingController.text,
                          ),
                        );
                  } else {
                    context.read<HomeCubit>().addWish(
                          WishModel(
                            // id: Random().nextInt(999).toString(),
                            title: textEditingController.text,
                            date: DateTime.now(),
                          ),
                        );
                  }
                },
                child: Text(widget.wish != null ? 'Save' : 'Add'),
              );
            },
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        widget.wish != null ? 'Edit Wish' : 'Add Wish',
      ),
      actions: [
        if (widget.wish != null)
          ElevatedButton(
            onPressed: () {
              context.read<HomeCubit>().deleteWish(widget.wish!);
            },
            child: const Icon(Icons.delete_rounded),
          ),
        const SizedBox(width: 16),
      ],
    );
  }
}
