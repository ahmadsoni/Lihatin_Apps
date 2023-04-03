import 'package:equatable/equatable.dart';
import 'package:lihatin/models/film_model.dart';

class TransactionModel extends Equatable {
  final String id;
  final FilmModel film;
  final int amoutOfFilm;
  final String selectSeat;
  final int price;
  final int grandTotal;

  TransactionModel({
    required this.film,
    this.amoutOfFilm = 0,
    this.price = 0,
    this.grandTotal = 0,
    this.selectSeat = '',
    this.id = '',
  });
  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        film: FilmModel.fromJson(json['film']['id'], json['film']),
        id: id,
        amoutOfFilm: json['amoutOfFilm'],
        selectSeat: json['selectSeat'],
        price: json['price'],
        grandTotal: json['grandTotal'],
      );
  @override
  List<Object?> get props => [
        film,
        amoutOfFilm,
        price,
        grandTotal,
        selectSeat,
      ];
}
