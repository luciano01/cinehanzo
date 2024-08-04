import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/movies/domain/domain.dart';

class MockGenreEntity extends Mock implements GenreEntity {}

void main() {
  late MockGenreEntity mockGenreEntity;

  setUp(() {
    mockGenreEntity = MockGenreEntity();
  });

  test('The id field must be of type int.', () {
    when(() => mockGenreEntity.id).thenReturn(0);
    expect(mockGenreEntity.id, isA<int>());
  });

  test('The name field must be of type String.', () {
    when(() => mockGenreEntity.name).thenReturn("");
    expect(mockGenreEntity.name, isA<String>());
  });
}
