import '../../domain.dart';

abstract class ListOfMoviesUseCase {
  /// Return a List of ResultMovies Entity.
  Future<ResultMoviesEntity> getMovies();
}

/// Implements the ListOfMoviesUseCase.
class ListOfMoviesUseCaseImpl implements ListOfMoviesUseCase {
  final ListOfMoviesRepository _listOfMoviesRepository;

  ListOfMoviesUseCaseImpl({required ListOfMoviesRepository listOfMoviesRepository})
      : _listOfMoviesRepository = listOfMoviesRepository;

  @override
  Future<ResultMoviesEntity> getMovies() async {
    return await _listOfMoviesRepository.getMovies();
  }
}
