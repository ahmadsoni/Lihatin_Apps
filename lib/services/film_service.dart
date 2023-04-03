import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lihatin/models/film_model.dart';

class FilmService {
  CollectionReference _filmRef = FirebaseFirestore.instance.collection('film');
  CollectionReference _newFilmRef =
      FirebaseFirestore.instance.collection('new_film');
  Future<List<FilmModel>> fetchNewFilm() async {
    try {
      QuerySnapshot result = await _newFilmRef.get();
      List<FilmModel> new_film = result.docs.map(
        (e) {
          return FilmModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();
      return new_film;
    } catch (e) {
      throw e;
    }
  }

  Future<List<FilmModel>> fetchFilm() async {
    try {
      QuerySnapshot result = await _filmRef.get();
      List<FilmModel> film = result.docs.map(
        (e) {
          return FilmModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();
      return film;
    } catch (e) {
      throw e;
    }
  }
}
