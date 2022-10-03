part of 'home_cubit.dart';

abstract class GetAllWishsState extends GeneralHomeState {}

class GetAllWishsInitial extends GetAllWishsState {
  @override
  List<Object> get props => [];
}

class GetAllWishsSuccess extends GetAllWishsState {
  GetAllWishsSuccess(this.wishs);

  final List<WishModel> wishs;

  @override
  List<Object> get props => [wishs];
}

class GetAllWishsLoading extends GetAllWishsState {}

class GetAllWishsFailure extends GetAllWishsState {
  GetAllWishsFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
