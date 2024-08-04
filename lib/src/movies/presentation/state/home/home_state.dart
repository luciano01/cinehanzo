import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:cinehanzo/src/movies/domain/domain.dart';
import '../../../../../core/core.dart';
import '../../../../authentication/presentation/presentation.dart';

class HomeState extends ChangeNotifier {
  final AuthState _authState;
  final ListOfMoviesUseCase _listOfMoviesUseCase;

  HomeState({
    required AuthState authState,
    required ListOfMoviesUseCase listOfMoviesUseCase,
  })  : _authState = authState,
        _listOfMoviesUseCase = listOfMoviesUseCase;

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  String get userEmail {
    return _authState.user?.email ?? "";
  }

  String get userUid {
    return _authState.user?.uid ?? "";
  }

  Future<void> getMovies() async {
    try {
      final result = await _listOfMoviesUseCase.getMovies();

      for (var movie in result.results) {
        print("");
        print(movie.originalTitle);
        print(movie.releaseDate);
        print(movie.overview);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> signOut() async {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      try {
        await _authState.signOut();
        await _authState.disconnect();
      } on ServerException catch (_) {}
    }).whenComplete(() {
      isLoading.value = false;
      Modular.to.pushReplacementNamed("/login");
    });
    notifyListeners();
  }
}
