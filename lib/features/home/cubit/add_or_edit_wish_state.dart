part of 'home_cubit.dart';

abstract class AddOrEditWishState extends GeneralHomeState {}

class AddOrEditWishInitial extends AddOrEditWishState {}

class AddOrEditWishSuccess extends AddOrEditWishState {
  AddOrEditWishSuccess(this.wish);

  final WishModel wish;

  @override
  List<Object> get props => [wish];
}

class AddOrEditWishLoading extends AddOrEditWishState {}

class AddOrEditWishFailure extends AddOrEditWishState {
  AddOrEditWishFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
