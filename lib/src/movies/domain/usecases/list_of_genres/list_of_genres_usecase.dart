import '../../domain.dart';

abstract class ListOfGenresUseCase {
  /// Return a List of ResultGenreEntity.
  Future<ResultGenresEntity> getGenres();
}

/// Implements the ListOfGenresUseCase.
class ListOfGenresUseCaseImpl implements ListOfGenresUseCase {
  final ListOfGenresRepository _listOfGenresRepository;

  ListOfGenresUseCaseImpl({required ListOfGenresRepository listOfGenresRepository})
      : _listOfGenresRepository = listOfGenresRepository;

  @override
  Future<ResultGenresEntity> getGenres() async {
    return await _listOfGenresRepository.getGenres();
  }
}
