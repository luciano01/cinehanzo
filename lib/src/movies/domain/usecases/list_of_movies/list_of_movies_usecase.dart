import '../../domain.dart';

abstract class ListOfMoviesUseCase {
  /// Return a List of ResultMovies Entity.
  Future<ResultMoviesEntity> getMovies({required int page});
}

/// Implements the ListOfMoviesUseCase.
class ListOfMoviesUseCaseImpl implements ListOfMoviesUseCase {
  final ListOfMoviesRepository _listOfMoviesRepository;

  ListOfMoviesUseCaseImpl({required ListOfMoviesRepository listOfMoviesRepository})
      : _listOfMoviesRepository = listOfMoviesRepository;

  @override
  Future<ResultMoviesEntity> getMovies({required int page}) async {
    return await _listOfMoviesRepository.getMovies(page: page);
  }
}
