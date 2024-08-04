import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:cinehanzo/src/movies/data/data.dart';

import '../../../src/authentication/presentation/presentation.dart';
import '../../../src/movies/domain/domain.dart';
import '../../../src/movies/presentation/presentation.dart';
import '../../core.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<Dio>(
      () => Dio(),
    );

    i.add<ListOfMoviesDataSource>(
      () => ListOfMoviesDataSourceImpl(
        dio: i.get<Dio>(),
      ),
    );

    i.add<ListOfMoviesRepository>(
      () => ListOfMoviesRepositoryImpl(
        listOfMoviesDataSource: i.get<ListOfMoviesDataSource>(),
      ),
    );

    i.add<ListOfMoviesUseCase>(
      () => ListOfMoviesUseCaseImpl(
        listOfMoviesRepository: i.get<ListOfMoviesRepository>(),
      ),
    );

    i.add<HomeState>(
      () => HomeState(
        authState: i.get<AuthState>(),
        listOfMoviesUseCase: i.get<ListOfMoviesUseCase>(),
      ),
    );
  }

  @override
  List<Module> get imports => [AppModule()];

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomeScreen());
  }
}
