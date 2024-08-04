import 'package:cinehanzo/src/movies/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cinehanzo/src/movies/data/data.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

final options = BaseOptions(
  baseUrl: "https://api.themoviedb.org/3",
  contentType: 'application/json;charset=utf-8',
  headers: {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZWM0MzA5MTRlOTdlMWU1MTA1Yzg0ODA3NzdjZGE5YSIsIm5iZiI6MTcyMjcyNDk4My4wMjgzODYsInN1YiI6IjVmODNiNTllMTc1MDUxMDAzNjlmYjUzYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GMSfi3-TnhSQk0JmX336rmuIOxHm8kK6kZUsqdFXYeM'
  },
);

void main() {
  late ListOfMoviesDataSourceImpl listOfMoviesDataSourceImpl;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    listOfMoviesDataSourceImpl = ListOfMoviesDataSourceImpl(
      dio: mockDio,
    );
  });

  test('Should execute a GET request with the given headers and URL.', () async {
    final mockResponse = {
      "page": 1,
      "results": [
        {
          "adult": false,
          "backdrop_path": "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
          "genre_ids": [28, 35, 878],
          "id": 533535,
          "original_language": "en",
          "original_title": "Deadpool & Wolverine",
          "overview":
              "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
          "popularity": 22036.206,
          "poster_path": "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
          "release_date": "2024-07-24",
          "title": "Deadpool & Wolverine",
          "video": false,
          "vote_average": 8.0,
          "vote_count": 1251
        },
      ],
      "total_pages": 45384,
      "total_results": 907676
    };

    when(() => mockDio.options).thenReturn(options);
    when(() => mockDio.get('/movie/popular?page=1')).thenAnswer((_) async => Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/movie/popular?page=1'),
        ));

    final result = await listOfMoviesDataSourceImpl.getMovies(page: 1);

    expect(result, isA<ResultMoviesEntity>());
    expect(result.results, isNotEmpty);
  });
}
