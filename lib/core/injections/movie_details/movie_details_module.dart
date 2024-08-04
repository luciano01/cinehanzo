import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:cinehanzo/src/movies/data/data.dart';

import '../../../src/movies/domain/domain.dart';
import '../../../src/movies/presentation/presentation.dart';

class MovieDetailsModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<Dio>(
      () => Dio(),
    );

    i.add<MovieDetailsDataSource>(
      () => MovieDetailsDataSourceImpl(
        dio: i.get<Dio>(),
      ),
    );

    i.add<MovieDetailsRepository>(
      () => MovieDetailsRepositoryImpl(
        movieDetailsDataSource: i.get<MovieDetailsDataSource>(),
      ),
    );

    i.add<MovieDetailsUseCase>(
      () => MovieDetailsUseCaseImpl(
        movieDetailsRepository: i.get<MovieDetailsRepository>(),
      ),
    );

    i.add<MovieDetailsState>(
      () => MovieDetailsState(
        movieDetailsUseCase: i.get<MovieDetailsUseCase>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => MovieDetailsScreen(movieId: r.args.data));
  }
}
