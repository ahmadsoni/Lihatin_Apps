import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lihatin/models/film_model.dart';
import 'package:lihatin/services/film_service.dart';

part 'film_state.dart';

class FilmCubit extends Cubit<FilmState> {
  FilmCubit() : super(FilmInitial()) {}

  void fetchFilm() async {
    try {
      emit(FilmLoading());
      List<FilmModel> film = await FilmService().fetchFilm();
      emit(FilmSuccess(film));
    } catch (e) {
      emit(FilmFailed(e.toString()));
    }
  }

  void newFetchFilm() async {
    try {
      emit(FilmLoading());
      List<FilmModel> new_film = await FilmService().fetchNewFilm();
      emit(FilmSuccess(new_film));
    } catch (e) {
      emit(FilmFailed(e.toString()));
    }
  }
}
