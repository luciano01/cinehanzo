import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/movies/domain/domain.dart';

class MockResultMoviesEntity extends Mock implements ResultMoviesEntity {}

void main() {
  late MockResultMoviesEntity mockResultMoviesEntity;

  setUp(() {
    mockResultMoviesEntity = MockResultMoviesEntity();
  });

  test('The page field must be of type int.', () {
    when(() => mockResultMoviesEntity.page).thenReturn(0);
    expect(mockResultMoviesEntity.page, isA<int>());
  });

  test('The totalPages field must be of type int.', () {
    when(() => mockResultMoviesEntity.totalPages).thenReturn(0);
    expect(mockResultMoviesEntity.totalPages, isA<int>());
  });

  test('The totalResults field must be of type int.', () {
    when(() => mockResultMoviesEntity.totalResults).thenReturn(0);
    expect(mockResultMoviesEntity.totalResults, isA<int>());
  });

  test('The results field must be of type List<MovieEntity>.', () {
    when(() => mockResultMoviesEntity.results).thenReturn(<MovieEntity>[]);
    expect(mockResultMoviesEntity.results, isA<List<MovieEntity>>());
  });
}
