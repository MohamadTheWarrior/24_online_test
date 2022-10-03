import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({required this.id});

  final String id;

  static const empty = UserModel(id: '');

  bool get isEmpty => this == UserModel.empty;

  @override
  List<Object?> get props => [id];
}
