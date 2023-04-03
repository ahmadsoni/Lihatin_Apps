import 'package:equatable/equatable.dart';

class FilmModel extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String genre;
  final String about;
  final int price;
  final double rating;

  FilmModel({
    required this.id,
    this.name = '',
    this.imageUrl = '',
    this.genre = '',
    this.about = '',
    this.price = 0,
    this.rating = 0.0,
  });

  factory FilmModel.fromJson(String id, Map<String, dynamic> json) => FilmModel(
        id: id,
        name: json['name'],
        imageUrl: json['imageUrl'],
        genre: json['genre'],
        price: json['price'],
        about: json['about'],
        rating: json['rating'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'genre': genre,
        'imageUrl': imageUrl,
        'rating': rating,
        'price': price,
      };
  @override
  List<Object?> get props => [id, name, genre, imageUrl, rating, price, about];
}
