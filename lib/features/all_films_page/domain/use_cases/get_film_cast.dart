import 'package:dartz/dartz.dart';
import 'package:microtectask/core/use_case/use_case.dart';
import 'package:microtectask/features/all_films_page/data/models/cast_model.dart';
import 'package:microtectask/features/all_films_page/data/repositories/all_films_repository.dart';
import 'package:microtectask/features/all_films_page/domain/params/flim_details_params.dart';


class GetFilmCastUseCase
    extends UseCase<Either<String,CastModel>, FilmDetailsParam > {
  final  AllFilmsRepository _allFilmsRepository;

  GetFilmCastUseCase(this._allFilmsRepository);

  @override
  Future<Either<String,CastModel>> call({ FilmDetailsParam ? p}) async {
    return  _allFilmsRepository.getFilmCast(p!);
  }
}