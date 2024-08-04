import 'package:flutter/cupertino.dart';

import '../../../domain/domain.dart';

class MovieDetailsState extends ChangeNotifier {
  final MovieDetailsUseCase _movieDetailsUseCase;

  MovieDetailsState({
    required MovieDetailsUseCase movieDetailsUseCase,
  }) : _movieDetailsUseCase = movieDetailsUseCase;

  bool isLoading = false;

  MovieDetailsEntity movie = MovieDetailsEntity.empty();

  Future<void> getMoviesDetails(int movieId) async {
    try {
      isLoading = true;
      movie = await _movieDetailsUseCase.getMovieDetails(id: movieId);
    } catch (error) {
      throw Exception();
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }
}
