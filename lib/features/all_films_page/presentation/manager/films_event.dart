part of 'films_bloc.dart';

abstract class FilmsEvent extends Equatable {
  const FilmsEvent();
}
class GetAllFilmsEvent extends FilmsEvent{
  final AllFilmsParams allFilmsParams;


 const GetAllFilmsEvent(this.allFilmsParams);

  @override

  List<Object?> get props => [allFilmsParams];
}
class GetFilmDetailsEvent extends FilmsEvent{
  final  FilmDetailsParam filmDetailsParam;


  const GetFilmDetailsEvent(this.filmDetailsParam);

  @override

  List<Object?> get props => [filmDetailsParam];
}
class GetFilmCastEvent extends FilmsEvent{
  final  FilmDetailsParam filmDetailsParam;


  const GetFilmCastEvent(this.filmDetailsParam);

  @override

  List<Object?> get props => [filmDetailsParam];
}
class GetFilmsSearchResultEvent extends FilmsEvent{
  final AllFilmsParams allFilmsParams;


  const GetFilmsSearchResultEvent(this.allFilmsParams);

  @override

  List<Object?> get props => [allFilmsParams];
}

