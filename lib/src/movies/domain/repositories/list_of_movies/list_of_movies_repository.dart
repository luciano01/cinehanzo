import '../../domain.dart';

abstract class ListOfMoviesRepository {
  /// Return a List of ResultMovies Entity.
  Future<ResultMoviesEntity> getMovies();
}
