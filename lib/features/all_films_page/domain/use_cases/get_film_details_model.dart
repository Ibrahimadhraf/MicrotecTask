import 'package:dartz/dartz.dart';
import 'package:microtectask/core/use_case/use_case.dart';
import 'package:microtectask/features/all_films_page/data/models/film_details_model.dart';
import 'package:microtectask/features/all_films_page/data/repositories/all_films_repository.dart';
import 'package:microtectask/features/all_films_page/domain/params/flim_details_params.dart';


class GetFilmDetailsUseCase
    extends UseCase<Either<String,FilmsDetailsModel>, FilmDetailsParam > {
  final  AllFilmsRepository _allFilmsRepository;

  GetFilmDetailsUseCase(this._allFilmsRepository);

  @override
  Future<Either<String, FilmsDetailsModel>> call({ FilmDetailsParam ? p}) async {
    return  _allFilmsRepository.getFilmDetails(p!);
  }
}