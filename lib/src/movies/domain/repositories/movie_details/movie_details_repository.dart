import '../../domain.dart';

abstract class MovieDetailsRepository {
  /// Return a MovieDetailsEntity.
  Future<MovieDetailsEntity> getMovieDetails({required int id});
}
