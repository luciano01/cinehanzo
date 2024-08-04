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

  final pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  ScrollController scrollController = ScrollController();

  bool isLoading = false;

  ResultMoviesEntity resultMoviesEntity = ResultMoviesEntity.empty();
  List<MovieEntity> get movies => resultMoviesEntity.results;

  int currentScreenIndex = 0;
  int currentPage = 1;

  String? get userPhotoURL => _authState.user?.photoURL;

  void updateScreenIndex(int value) {
    currentScreenIndex = value;
    pageController.jumpToPage(value);
    notifyListeners();
  }

  Future<void> getMovies({required int page}) async {
    try {
      isLoading = true;
      var newMovies = await _listOfMoviesUseCase.getMovies(page: page);
      movies.addAll(newMovies.results);
      currentPage = page;
    } catch (error) {
      throw Exception();
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    isLoading = true;
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      try {
        await _authState.signOut();
        await _authState.disconnect();
      } on ServerException catch (_) {}
    }).whenComplete(() {
      isLoading = false;
      Modular.to.pushReplacementNamed("/login");
    });
  }
}
