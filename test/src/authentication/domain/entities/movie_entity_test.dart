import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/authentication/domain/domain.dart';

class MockMovieEntity extends Mock implements MovieEntity {}

void main() {
  late MockMovieEntity mockMovieEntity;

  setUp(() {
    mockMovieEntity = MockMovieEntity();
  });

  test('The adult field must be of type bool.', () {
    when(() => mockMovieEntity.adult).thenReturn(false);
    expect(mockMovieEntity.adult, isA<bool>());
  });

  test('The backdropPath field must be of type String.', () {
    when(() => mockMovieEntity.backdropPath).thenReturn("");
    expect(mockMovieEntity.backdropPath, isA<String>());
  });

  test('The genreIds field must be of type List<int>.', () {
    when(() => mockMovieEntity.genreIds).thenReturn(<int>[]);
    expect(mockMovieEntity.genreIds, isA<List<int>>());
  });

  test('The id field must be of type int.', () {
    when(() => mockMovieEntity.id).thenReturn(0);
    expect(mockMovieEntity.id, isA<int>());
  });

  test('The originalLanguage field must be of type String.', () {
    when(() => mockMovieEntity.originalLanguage).thenReturn("");
    expect(mockMovieEntity.originalLanguage, isA<String>());
  });

  test('The originalTitle field must be of type String.', () {
    when(() => mockMovieEntity.originalTitle).thenReturn("");
    expect(mockMovieEntity.originalTitle, isA<String>());
  });

  test('The overview field must be of type String.', () {
    when(() => mockMovieEntity.overview).thenReturn("");
    expect(mockMovieEntity.overview, isA<String>());
  });

  test('The popularity field must be of type double.', () {
    when(() => mockMovieEntity.popularity).thenReturn(0.0);
    expect(mockMovieEntity.popularity, isA<double>());
  });

  test('The releaseDate field must be of type DateTime.', () {
    when(() => mockMovieEntity.releaseDate).thenReturn(DateTime.now());
    expect(mockMovieEntity.releaseDate, isA<DateTime>());
  });

  test('The title field must be of type String.', () {
    when(() => mockMovieEntity.title).thenReturn("");
    expect(mockMovieEntity.title, isA<String>());
  });

  test('The video field must be of type bool.', () {
    when(() => mockMovieEntity.video).thenReturn(false);
    expect(mockMovieEntity.video, isA<bool>());
  });

  test('The voteAverage field must be of type double.', () {
    when(() => mockMovieEntity.voteAverage).thenReturn(0.0);
    expect(mockMovieEntity.voteAverage, isA<double>());
  });

  test('The voteCount field must be of type String.', () {
    when(() => mockMovieEntity.voteCount).thenReturn(0);
    expect(mockMovieEntity.voteCount, isA<int>());
  });
}
