part of 'film_cubit.dart';

abstract class FilmState extends Equatable {
  const FilmState();

  @override
  List<Object> get props => [];
}

class FilmInitial extends FilmState {}

class FilmLoading extends FilmState {}

class FilmSuccess extends FilmState {
  final List<FilmModel> film;

  FilmSuccess(this.film);

  @override
  List<Object> get props => [film];
}

class FilmFailed extends FilmState {
  final String error;
  FilmFailed(this.error);

  @override
  List<Object> get props => [error];
}
