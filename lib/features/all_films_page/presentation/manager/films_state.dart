part of 'films_bloc.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();
}

class FilmsInitial extends FilmsState {
  @override
  List<Object> get props => [];
}
class Loading extends FilmsState {
  @override
  List<Object> get props => [];
}
class LoadingFilmsSuccess extends FilmsState {
  final FilmsModel filmsModel;


  const LoadingFilmsSuccess(this.filmsModel);

  @override
  List<Object> get props => [filmsModel];
}
class LoadingFilmsFailed extends FilmsState {
  final String message;


  const LoadingFilmsFailed(this.message);

  @override
  List<Object> get props => [message];
}
class LoadingFilmDetailsSuccess extends FilmsState {
  final FilmsDetailsModel filmsDetailsModel;


  const LoadingFilmDetailsSuccess(this.filmsDetailsModel);

  @override
  List<Object> get props => [filmsDetailsModel];
}
class LoadingFilmDetailsFailed extends FilmsState {
  final String message;


  const LoadingFilmDetailsFailed(this.message);

  @override
  List<Object> get props => [message];
}
class LoadingFilmCastSuccess extends FilmsState {
  final CastModel castModel;


  const  LoadingFilmCastSuccess(this.castModel);

  @override
  List<Object> get props => [castModel];
}
class LoadingFilmCastFailed extends FilmsState {
  final String message;


  const LoadingFilmCastFailed(this.message);

  @override
  List<Object> get props => [message];
}
class LoadingFilmResultSuccess extends FilmsState {
  final FilmsModel filmsModel;


  const LoadingFilmResultSuccess(this.filmsModel);

  @override
  List<Object> get props => [filmsModel];
}
class LoadingFilmResultFailed extends FilmsState {
  final String message;


  const LoadingFilmResultFailed (this.message);

  @override
  List<Object> get props => [message];
}

