import "../../../domain/domain.dart";
import '../../data.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailsDataSource _movieDetailsDataSource;

  MovieDetailsRepositoryImpl({required MovieDetailsDataSource movieDetailsDataSource})
      : _movieDetailsDataSource = movieDetailsDataSource;
  @override
  Future<MovieDetailsEntity> getMovieDetails({required int id}) async {
    return await _movieDetailsDataSource.getMovieDetails(id: id);
  }
}
