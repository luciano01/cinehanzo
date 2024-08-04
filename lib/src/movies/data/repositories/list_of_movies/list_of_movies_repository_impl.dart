import '../../../domain/domain.dart';
import '../../data.dart';

class ListOfMoviesRepositoryImpl implements ListOfMoviesRepository {
  final ListOfMoviesDataSource _listOfMoviesDataSource;

  ListOfMoviesRepositoryImpl({required ListOfMoviesDataSource listOfMoviesDataSource})
      : _listOfMoviesDataSource = listOfMoviesDataSource;

  @override
  Future<ResultMoviesEntity> getMovies({required int page}) async {
    return await _listOfMoviesDataSource.getMovies(page: page);
  }
}
