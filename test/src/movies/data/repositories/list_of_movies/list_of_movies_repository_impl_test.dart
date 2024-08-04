import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/movies/data/data.dart';
import 'package:cinehanzo/src/movies/domain/domain.dart';

class MockListOfMoviesDataSource extends Mock implements ListOfMoviesDataSource {}

class MockResultMoviesEntity extends Mock implements ResultMoviesEntity {}

void main() {
  late MockListOfMoviesDataSource mockListOfMoviesDataSource;
  late ListOfMoviesRepositoryImpl listOfMoviesRepositoryImpl;
  late MockResultMoviesEntity mockResultMoviesEntity;

  setUp(() {
    mockListOfMoviesDataSource = MockListOfMoviesDataSource();
    listOfMoviesRepositoryImpl = ListOfMoviesRepositoryImpl(
      listOfMoviesDataSource: mockListOfMoviesDataSource,
    );
    mockResultMoviesEntity = MockResultMoviesEntity();
  });

  test('Should return a object of ResultMoviesEntity from Datasource.', () async {
    when(() => mockListOfMoviesDataSource.getMovies(page: 1))
        .thenAnswer((_) async => mockResultMoviesEntity);

    final result = await listOfMoviesRepositoryImpl.getMovies(page: 1);

    expect(result, equals(mockResultMoviesEntity));
    verify(() => mockListOfMoviesDataSource.getMovies(page: 1));
  });
}
