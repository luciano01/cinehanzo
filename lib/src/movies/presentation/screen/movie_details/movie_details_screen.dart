import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/core.dart';
import '../../presentation.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });
  final int movieId;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final movieDetailsState = Modular.get<MovieDetailsState>();

  @override
  void initState() {
    getMovieDetails();
    super.initState();
  }

  Future<void> getMovieDetails() async {
    await movieDetailsState.getMoviesDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: movieDetailsState,
      builder: (_, __) {
        return Scaffold(
          body: _buildMovieDetailsContent(),
        );
      },
    );
  }

  Widget _buildMovieDetailsContent() {
    if (movieDetailsState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 500,
          leading: Container(
            decoration: BoxDecoration(
              color: AppColors.greyLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {
                Modular.to.pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: 'moviePoster_${movieDetailsState.movie.id}',
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movieDetailsState.movie.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          stretch: true,
          stretchTriggerOffset: 150,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow.shade700,
                            ),
                            Text(movieDetailsState.movie.voteAverage!.toStringAsFixed(1)),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              color: Colors.black,
                            ),
                            Text(movieDetailsState.movie.runtime!.toString()),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_rounded,
                              color: Colors.black,
                            ),
                            Text(formatDateToAmerican(movieDetailsState.movie.releaseDate!)),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.money_rounded,
                                color: Colors.black,
                              ),
                              Text("${convertToDollars(movieDetailsState.movie.budget!)} (buget)"),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.money_rounded,
                                color: Colors.black,
                              ),
                              Text(
                                  "${convertToDollars(movieDetailsState.movie.revenue!)} (revenue)"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      movieDetailsState.movie.title!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: movieDetailsState.movie.genres!.map((genre) {
                        return Chip(
                          label: Text(genre.name!),
                          backgroundColor: AppColors.pink.withOpacity(0.3),
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Text(
                        textAlign: TextAlign.justify,
                        movieDetailsState.movie.overview!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: movieDetailsState.movie.productionCompanies!.length,
                        itemBuilder: (context, index) {
                          final company = movieDetailsState.movie.productionCompanies![index];
                          return company.logoPath!.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(
                                    8,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/w500${company.logoPath}',
                                      fit: BoxFit.contain,
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
