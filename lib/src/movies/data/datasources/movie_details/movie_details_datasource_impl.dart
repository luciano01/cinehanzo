import 'package:dio/dio.dart';

import '../../../domain/domain.dart';

abstract class MovieDetailsDataSource {
  /// Return a MovieDetailsEntity.
  Future<MovieDetailsEntity> getMovieDetails({required int id});
}

class MovieDetailsDataSourceImpl implements MovieDetailsDataSource {
  final Dio _dio;

  MovieDetailsDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<MovieDetailsEntity> getMovieDetails({required int id}) async {
    final options = BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      contentType: 'application/json;charset=utf-8',
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZWM0MzA5MTRlOTdlMWU1MTA1Yzg0ODA3NzdjZGE5YSIsIm5iZiI6MTcyMjcyNDk4My4wMjgzODYsInN1YiI6IjVmODNiNTllMTc1MDUxMDAzNjlmYjUzYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GMSfi3-TnhSQk0JmX336rmuIOxHm8kK6kZUsqdFXYeM'
      },
    );

    _dio.options = options;

    try {
      final response = await _dio.get('/movie/$id');

      if (response.statusCode == 200) {
        final data = response.data;
        return MovieDetailsEntity.fromJson(data);
      } else {
        throw Exception();
      }
    } catch (error) {
      throw Exception();
    }
  }
}
