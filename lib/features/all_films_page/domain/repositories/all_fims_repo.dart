import 'package:dartz/dartz.dart';
import 'package:microtectask/features/all_films_page/data/models/cast_model.dart';
import 'package:microtectask/features/all_films_page/data/models/film_details_model.dart';
import 'package:microtectask/features/all_films_page/data/models/films_model.dart';
import 'package:microtectask/features/all_films_page/domain/params/all_films_params.dart';
import 'package:microtectask/features/all_films_page/domain/params/flim_details_params.dart';

abstract class AllFilmsRepo{

  Future<Either<String, FilmsModel>> getAllFilms(AllFilmsParams allFilmsParams);
  Future<Either<String, FilmsDetailsModel>> getFilmDetails(FilmDetailsParam filmDetailsParam);
  Future<Either<String, CastModel>> getFilmCast(FilmDetailsParam filmDetailsParam);
  Future<Either<String, FilmsModel>> getFilmSearchResult(AllFilmsParams allFilmsParams);
}