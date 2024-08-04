import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/movies/domain/domain.dart';

class MockResultGenresEntity extends Mock implements ResultGenresEntity {}

void main() {
  late MockResultGenresEntity mockResultGenresEntity;

  setUp(() {
    mockResultGenresEntity = MockResultGenresEntity();
  });

  test('The genres field must be of type List<GenreEntity>.', () {
    when(() => mockResultGenresEntity.genres).thenReturn(<GenreEntity>[]);
    expect(mockResultGenresEntity.genres, isA<List<GenreEntity>>());
  });
}
