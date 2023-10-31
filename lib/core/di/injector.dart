




import 'package:get_it/get_it.dart';
import 'package:microtectask/core/dio_service/dio_provider.dart';
import 'package:microtectask/core/dio_service/dio_service.dart';
import 'package:microtectask/core/dio_service/dio_service_impl.dart';
import 'package:microtectask/core/network_service/network_provider.dart';
import 'package:microtectask/core/network_service/network_service.dart';
import 'package:microtectask/core/network_service/network_service_impl.dart';
import 'package:microtectask/features/all_films_page/data/data_sources/all_films_data_source.dart';
import 'package:microtectask/features/all_films_page/data/repositories/all_films_repository.dart';
import 'package:microtectask/features/all_films_page/domain/use_cases/get_all_fims_use_case.dart';
import 'package:microtectask/features/all_films_page/domain/use_cases/get_film_cast.dart';
import 'package:microtectask/features/all_films_page/domain/use_cases/get_film_details_model.dart';
import 'package:microtectask/features/all_films_page/domain/use_cases/get_films_search_result_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/all_films_page/domain/repositories/all_fims_repo.dart';


final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);


  sl.registerLazySingleton<NetworkService>(
        () => NetworkServiceImpl(
      networkProvider: sl(),
    ),
  );
  sl.registerLazySingleton<DioService>(
        () => DioServiceImpl(
      dioProvider: sl(),
    ),
  );
  sl.registerLazySingleton<DioProvider>(
        () => DioProvider.instance,
  );
  sl.registerLazySingleton<NetworkProvider>(
        () => NetworkProvider.instance,
  );
  GetAllFilmsUseCase initGetAllFilmsUseCase() {
    AllFilmsDataSourceImplementation allFilmsDataSourceImplementation;
    AllFilmsRepository allFilmsRepository;
    allFilmsDataSourceImplementation=  AllFilmsDataSourceImplementation(sl());
    allFilmsRepository = AllFilmsRepository( sl(),allFilmsDataSourceImplementation);
    return   GetAllFilmsUseCase(   allFilmsRepository);
  }
  GetFilmDetailsUseCase initGetFilmDetailsUseCase() {
    AllFilmsDataSourceImplementation allFilmsDataSourceImplementation;
    AllFilmsRepository allFilmsRepository;
    allFilmsDataSourceImplementation=  AllFilmsDataSourceImplementation(sl());
    allFilmsRepository = AllFilmsRepository( sl(),allFilmsDataSourceImplementation);
    return   GetFilmDetailsUseCase(   allFilmsRepository);
  }
  GetFilmCastUseCase initGetFilmCastUseCase() {
    AllFilmsDataSourceImplementation allFilmsDataSourceImplementation;
    AllFilmsRepository allFilmsRepository;
    allFilmsDataSourceImplementation=  AllFilmsDataSourceImplementation(sl());
    allFilmsRepository = AllFilmsRepository( sl(),allFilmsDataSourceImplementation);
    return    GetFilmCastUseCase(   allFilmsRepository);
  }
  GetFilmsSearchResultUseCase initGetFilmsSearchResultUseCase() {
    AllFilmsDataSourceImplementation allFilmsDataSourceImplementation;
    AllFilmsRepository allFilmsRepository;
    allFilmsDataSourceImplementation=  AllFilmsDataSourceImplementation(sl());
    allFilmsRepository = AllFilmsRepository( sl(),allFilmsDataSourceImplementation);
    return    GetFilmsSearchResultUseCase(   allFilmsRepository);
  }
  GetAllFilmsUseCase getAllFilmsUseCase=initGetAllFilmsUseCase();
  GetFilmsSearchResultUseCase getFilmsSearchResultUseCase=initGetFilmsSearchResultUseCase();
  GetFilmDetailsUseCase getFilmDetailsUseCase =initGetFilmDetailsUseCase();
  GetFilmCastUseCase getFilmCastUseCase=initGetFilmCastUseCase();
  sl.registerLazySingleton(() =>  getAllFilmsUseCase);
  sl.registerLazySingleton(() =>  getFilmDetailsUseCase );
  sl.registerLazySingleton(() => getFilmCastUseCase );
  sl.registerLazySingleton(() =>  getFilmsSearchResultUseCase );




}
