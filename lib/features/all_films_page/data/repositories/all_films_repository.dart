import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:microtectask/core/exceptions/network_exception.dart';
import 'package:microtectask/core/exceptions/server_exception.dart';
import 'package:microtectask/core/network_service/network_service.dart';
import 'package:microtectask/core/utils/netwoek_utils.dart';
import 'package:microtectask/features/all_films_page/data/data_sources/all_films_data_source.dart';
import 'package:microtectask/features/all_films_page/data/models/cast_model.dart';
import 'package:microtectask/features/all_films_page/data/models/film_details_model.dart';
import 'package:microtectask/features/all_films_page/data/models/films_model.dart';
import 'package:microtectask/features/all_films_page/domain/params/all_films_params.dart';
import 'package:microtectask/features/all_films_page/domain/params/flim_details_params.dart';
import 'package:microtectask/features/all_films_page/domain/repositories/all_fims_repo.dart';

class AllFilmsRepository extends AllFilmsRepo{
  final NetworkService _networkService;
  final AllFilmsDataSource _allFilmsDataSource;

  AllFilmsRepository(this._networkService, this._allFilmsDataSource);

  @override
  Future<Either<String, FilmsModel>> getAllFilms(AllFilmsParams allFilmsParams) async{
    try {
      final connected = await _networkService.isConnected;
      // if (!connected) {
      //   throw const NetworkException(
      //     arMessage: Network_Connection_Ar_Error,
      //     enMessage: Network_Connection_En_Error,
      //   );
      // }
      final result = await _allFilmsDataSource.getAllFilms(allFilmsParams);

      debugPrint(result.toJson().toString());
      return Right(result);
    }  on ServerException catch (e) {
      return Left( e.arMessage);
    } on NetworkException catch (e) {
      return Left( e.arMessage);
    }
  }

  @override
  Future<Either<String, FilmsDetailsModel>> getFilmDetails(FilmDetailsParam filmDetailsParam) async{
    try {
      final connected = await _networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await _allFilmsDataSource.getFilmDetails(filmDetailsParam);

      debugPrint(result.toJson().toString());
      return Right(result);
    }  on ServerException catch (e) {
      return Left( e.arMessage);
    } on NetworkException catch (e) {
      return Left( e.arMessage);
    }
  }

  @override
  Future<Either<String, CastModel>> getFilmCast(FilmDetailsParam filmDetailsParam)async {
    try {
      final connected = await _networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await _allFilmsDataSource.getFilmCast(filmDetailsParam);

      debugPrint(result.toJson().toString());
      return Right(result);
    }  on ServerException catch (e) {
      return Left( e.arMessage);
    } on NetworkException catch (e) {
      return Left( e.arMessage);
    }
  }

  @override
  Future<Either<String, FilmsModel>> getFilmSearchResult(AllFilmsParams allFilmsParams)async {
    try {
      final connected = await _networkService.isConnected;
      if (!connected) {
        throw const NetworkException(
          arMessage: Network_Connection_Ar_Error,
          enMessage: Network_Connection_En_Error,
        );
      }
      final result = await _allFilmsDataSource.getAllFilms(allFilmsParams);

      debugPrint(result.toJson().toString());
      return Right(result);
    }  on ServerException catch (e) {
      return Left( e.arMessage);
    } on NetworkException catch (e) {
      return Left( e.arMessage);
    }
  }
}