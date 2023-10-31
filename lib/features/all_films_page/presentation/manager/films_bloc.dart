import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:microtectask/features/all_films_page/data/models/cast_model.dart';
import 'package:microtectask/features/all_films_page/data/models/film_details_model.dart';
import 'package:microtectask/features/all_films_page/data/models/films_model.dart';
import 'package:microtectask/features/all_films_page/domain/params/all_films_params.dart';
import 'package:microtectask/features/all_films_page/domain/params/flim_details_params.dart';
import 'package:microtectask/features/all_films_page/domain/use_cases/get_all_fims_use_case.dart';
import 'package:microtectask/features/all_films_page/domain/use_cases/get_film_cast.dart';
import 'package:microtectask/features/all_films_page/domain/use_cases/get_film_details_model.dart';
import 'package:microtectask/features/all_films_page/domain/use_cases/get_films_search_result_use_case.dart';

part 'films_event.dart';

part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  FilmsModel? filmsModel;
  FilmsModel? filmsModelResult;
  CastModel?castModel;
  FilmsDetailsModel? filmsDetailsModel;
  GetFilmDetailsUseCase getFilmDetailsUseCase;
  GetFilmCastUseCase getFilmCastUseCase;
  GetFilmsSearchResultUseCase getFilmsSearchResultUseCase;
  final GetAllFilmsUseCase getAllFilmsUseCase;

  FilmsBloc({required this.getAllFilmsUseCase,required this.getFilmDetailsUseCase,required this.getFilmCastUseCase,
  required this.getFilmsSearchResultUseCase}) : super(FilmsInitial()) {
    on<FilmsEvent>((event, emit) async{
      if (event is GetAllFilmsEvent) {

       event.allFilmsParams.page==1? emit(Loading()):debugPrint("NotShowLoading");
        final getAllFilmsOrNot= await getAllFilmsUseCase.call(p: event.allFilmsParams);
        emit(_eitherGetAllFilmsOrNotOrNot(getAllFilmsOrNot));
      }else if(event is GetFilmDetailsEvent){
        emit(Loading());
        final getFilDetailsOrNot= await getFilmDetailsUseCase.call(p: event.filmDetailsParam);
        emit(_eitherGetFilmDetailsOrNotOrNot(getFilDetailsOrNot));

      }else if(event is GetFilmCastEvent){
        emit(Loading());
        final getFilmCastOrNot= await getFilmCastUseCase.call(p: event.filmDetailsParam);
        emit(_eitherGetFilmCastOrNotOrNot(getFilmCastOrNot));
      }else if(event is GetFilmsSearchResultEvent){
        event.allFilmsParams.page==1? emit(Loading()):debugPrint("NotShowLoading");
        final getFilmCastOrNot= await getFilmsSearchResultUseCase.call(p: event.allFilmsParams);
      emit(_eitherGetFilmSearchResultOrNotOrNot(getFilmCastOrNot));
      }
    });
  }

  _eitherGetAllFilmsOrNotOrNot(Either<String, dynamic> either) {
    return either.fold((l) {
      return LoadingFilmsFailed(l);
    }, (r) {
      filmsModel = null;
      filmsModel = r;
      return LoadingFilmsSuccess(r);
    });
  }
  _eitherGetFilmDetailsOrNotOrNot(Either<String, dynamic> either) {
    return either.fold((l) {
      return LoadingFilmDetailsFailed(l);
    }, (r) {

    filmsDetailsModel = r;
      return LoadingFilmDetailsSuccess(r);
    });
  }
  _eitherGetFilmCastOrNotOrNot(Either<String, dynamic> either) {
    return either.fold((l) {
      return LoadingFilmCastFailed(l);
    }, (r) {

      castModel = r;
      return LoadingFilmCastSuccess(r);
    });
  }
  _eitherGetFilmSearchResultOrNotOrNot(Either<String, dynamic> either) {
    return either.fold((l) {
      return LoadingFilmResultFailed(l);
    }, (r) {
     filmsModelResult=r;

      return LoadingFilmResultSuccess(r);
    });
  }
}
