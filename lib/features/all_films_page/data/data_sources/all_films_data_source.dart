
import 'package:flutter/material.dart';
import 'package:microtectask/core/dio_service/dio_service.dart';
import 'package:microtectask/core/dio_service/server_request.dart';
import 'package:microtectask/core/utils/app_end_point.dart';
import 'package:microtectask/features/all_films_page/data/models/cast_model.dart';
import 'package:microtectask/features/all_films_page/data/models/film_details_model.dart';
import 'package:microtectask/features/all_films_page/data/models/films_model.dart';
import 'package:microtectask/features/all_films_page/domain/params/all_films_params.dart';
import 'package:microtectask/features/all_films_page/domain/params/flim_details_params.dart';

abstract class AllFilmsDataSource{
  Future< FilmsModel>getAllFilms(AllFilmsParams? allFilmsParams);
  Future< FilmsDetailsModel>getFilmDetails(FilmDetailsParam?filmDetailsParam);
  Future< CastModel>getFilmCast(FilmDetailsParam?filmDetailsParam);
  Future< FilmsModel>getSearchFilmResult(AllFilmsParams? allFilmsParams);
}
class AllFilmsDataSourceImplementation extends AllFilmsDataSource{
  DioService dioService;


  AllFilmsDataSourceImplementation(this.dioService);

  @override
  Future<FilmsModel> getAllFilms(AllFilmsParams? allFilmsParams) async{
    print("urllllllll>>>>>>$baseApiUrl$allFilmsEndPoint?api_key=$apiKey&page=${allFilmsParams?.page??1}");
    final result = await serverRequest(
      call: () async => await  dioService.get(
          endPoint:"$baseApiUrl$allFilmsEndPoint?api_key=$apiKey&page=${allFilmsParams?.page??1}",




      ),
    );
    final response= FilmsModel.fromJson(result);
   // debugPrint("CHEKRESponse>>>>${response.toJson().toString()}");
    return response;
  }

  @override
  Future<FilmsDetailsModel> getFilmDetails(FilmDetailsParam?filmDetailsParam)async {
    final result = await serverRequest(
      call: () async => await  dioService.get(
        endPoint:"${filmDetailsParam?.filmId}?api_key=$apiKey",




      ),
    );
    final response= FilmsDetailsModel.fromJson(result);
    debugPrint("CHEKRESponse>>>>${response.toJson().toString()}");
    return response;
  }

  @override
  Future<CastModel> getFilmCast(FilmDetailsParam? filmDetailsParam) async{
    final result = await serverRequest(
      call: () async => await  dioService.get(
        endPoint:"${filmDetailsParam?.filmId}/$castEndPont?api_key=$apiKey",




      ),
    );
    final response= CastModel.fromJson(result);
    debugPrint("CHEKRESponse>>>>${response.toJson().toString()}");
    return response;
  }

  @override
  Future<FilmsModel> getSearchFilmResult(AllFilmsParams? allFilmsParams)async {
    final result = await serverRequest(
      call: () async => await  dioService.get(
        endPoint:"$baseApiUrl$allFilmsEndPoint?api_key=$apiKey&query=${allFilmsParams?.title}&page=${allFilmsParams?.page??1}",




      ),
    );
    final response= FilmsModel.fromJson(result);
    debugPrint("CHEKRESponse>>>>${response.toJson().toString()}");
    return response;
  }
}