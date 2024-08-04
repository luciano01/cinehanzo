import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/movies/domain/domain.dart';

class MockMovieDetailsRepository extends Mock implements MovieDetailsRepository {}

class MockMovieDetailsEntity extends Mock implements MovieDetailsEntity {}

void main() {
  late MockMovieDetailsRepository mockMovieDetailsRepository;
  late MovieDetailsUseCaseImpl movieDetailsUseCaseImpl;
  late MockMovieDetailsEntity mockMovieDetailsEntity;

  setUp(() {
    mockMovieDetailsRepository = MockMovieDetailsRepository();
    movieDetailsUseCaseImpl = MovieDetailsUseCaseImpl(
      movieDetailsRepository: mockMovieDetailsRepository,
    );
    mockMovieDetailsEntity = MockMovieDetailsEntity();
  });

  test('Should return an object of type MovieDetailsEntity.', () async {
    when(() => mockMovieDetailsRepository.getMovieDetails(id: 0))
        .thenAnswer((_) async => mockMovieDetailsEntity);

    final result = await movieDetailsUseCaseImpl.getMovieDetails(id: 0);

    expect(result, mockMovieDetailsEntity);
    verify(() => mockMovieDetailsRepository.getMovieDetails(id: 0));
  });
}
