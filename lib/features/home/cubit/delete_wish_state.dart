part of 'home_cubit.dart';

abstract class DeleteWishState extends GeneralHomeState {}

class DeleteWishInitial extends DeleteWishState {
  @override
  List<Object> get props => [];
}

class DeleteWishSuccess extends DeleteWishState {
  DeleteWishSuccess(this.wish);

  final WishModel wish;

  @override
  List<Object> get props => [wish];
}

class DeleteWishLoading extends DeleteWishState {}

class DeleteWishFailure extends DeleteWishState {
  DeleteWishFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
