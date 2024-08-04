import '../../domain.dart';

abstract class ListOfGenresRepository {
  /// Return a List of ResultGenreEntity.
  Future<ResultGenresEntity> getGenres();
}
