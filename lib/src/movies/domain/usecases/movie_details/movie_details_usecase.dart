import '../../domain.dart';

abstract class MovieDetailsUseCase {
  /// Return a MovieDetailsEntity.
  Future<MovieDetailsEntity> getMovieDetails({required int id});
}

class MovieDetailsUseCaseImpl implements MovieDetailsUseCase {
  final MovieDetailsRepository _movieDetailsRepository;

  MovieDetailsUseCaseImpl({required MovieDetailsRepository movieDetailsRepository})
      : _movieDetailsRepository = movieDetailsRepository;

  @override
  Future<MovieDetailsEntity> getMovieDetails({required int id}) async {
    return await _movieDetailsRepository.getMovieDetails(id: id);
  }
}
