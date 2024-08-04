import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/movies/domain/domain.dart';

class MockListOfMoviesRepository extends Mock implements ListOfMoviesRepository {}

class MockResultMoviesEntity extends Mock implements ResultMoviesEntity {}

void main() {
  late MockListOfMoviesRepository mockListOfMoviesRepository;
  late ListOfMoviesUseCaseImpl listOfMoviesUseCaseImpl;
  late MockResultMoviesEntity mockResultMoviesEntity;

  setUp(() {
    mockListOfMoviesRepository = MockListOfMoviesRepository();
    listOfMoviesUseCaseImpl = ListOfMoviesUseCaseImpl(
      listOfMoviesRepository: mockListOfMoviesRepository,
    );
    mockResultMoviesEntity = MockResultMoviesEntity();
  });

  test('Should return an object of type ResultMoviesEntity.', () async {
    when(() => mockListOfMoviesRepository.getMovies())
        .thenAnswer((_) async => mockResultMoviesEntity);

    final result = await listOfMoviesUseCaseImpl.getMovies();

    expect(result, mockResultMoviesEntity);
    verify(() => mockListOfMoviesRepository.getMovies());
  });
}
