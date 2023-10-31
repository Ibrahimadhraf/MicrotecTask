import 'package:dartz/dartz.dart';
import 'package:microtectask/core/use_case/use_case.dart';
import 'package:microtectask/features/all_films_page/data/models/films_model.dart';
import 'package:microtectask/features/all_films_page/data/repositories/all_films_repository.dart';
import 'package:microtectask/features/all_films_page/domain/params/all_films_params.dart';


class GetAllFilmsUseCase
    extends UseCase<Either<String,FilmsModel>, AllFilmsParams > {
  final  AllFilmsRepository _allFilmsRepository;

  GetAllFilmsUseCase(this._allFilmsRepository);

  @override
  Future<Either<String, FilmsModel>> call({ AllFilmsParams ? p}) async {
    return  _allFilmsRepository.getAllFilms(p!);
  }
}