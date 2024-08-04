import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/core.dart';
import '../../state/home/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeState = Modular.get<HomeState>();

  void _scrollScreen() {
    if (homeState.scrollController.position.pixels ==
        homeState.scrollController.position.maxScrollExtent) {
      homeState.getMovies(page: homeState.currentPage + 1);
    }
  }

  @override
  void initState() {
    super.initState();
    homeState.scrollController.addListener(_scrollScreen);
    homeState.getMovies(page: 1);
  }

  @override
  void dispose() {
    homeState.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: homeState,
      builder: (_, __) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Text(
                      AppConstants.labelCine,
                      style: AppStyles.labelCine.copyWith(fontSize: 10),
                    ),
                    Image.asset(
                      AppImages.hanzoLogo,
                      width: 80,
                    ),
                  ],
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    image: DecorationImage(
                      image: homeState.userPhotoURL != null && homeState.userPhotoURL!.isNotEmpty
                          ? NetworkImage(homeState.userPhotoURL!)
                          : const AssetImage(AppImages.noUserPhoto) as ImageProvider<Object>,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Flexible(
                child: _buildMovieContent(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMovieContent() {
    if (homeState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return GridView.builder(
      controller: homeState.scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.70,
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      itemCount: homeState.resultMoviesEntity.results.length,
      itemBuilder: (context, index) {
        final movieEntity = homeState.resultMoviesEntity.results[index];

        if (index < homeState.resultMoviesEntity.results.length) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${movieEntity.posterPath}',
                ),
                fit: BoxFit.fill,
              ),
            ),
          );
        } else {
          return homeState.isLoading
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SizedBox.shrink();
        }
      },
    );
  }
}
