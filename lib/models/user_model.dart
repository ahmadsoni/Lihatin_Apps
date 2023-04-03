import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String genre;
  final int balance;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.genre = '',
    this.balance = 0,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [id, email, name, genre, balance];
}
