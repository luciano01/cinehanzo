import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          endDrawer: Drawer(
            backgroundColor: AppColors.white,
            child: Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: AppColors.white),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.white,
                        backgroundImage:
                            homeState.userPhotoURL != null && homeState.userPhotoURL!.isNotEmpty
                                ? NetworkImage(homeState.userPhotoURL!)
                                : const AssetImage(AppImages.noUserPhoto) as ImageProvider<Object>,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            homeState.userName ?? 'User',
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            homeState.userEmail ?? '',
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                Visibility(
                  visible: !homeState.isLoadingSignOut,
                  replacement: const LinearProgressIndicator(),
                  child: ListTile(
                    title: const Text('Sair'),
                    leading: const Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    ),
                    onTap: () {
                      homeState.signOut();
                    },
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        image: DecorationImage(
                          image: homeState.userPhotoURL != null &&
                                  homeState.userPhotoURL!.isNotEmpty
                              ? NetworkImage(homeState.userPhotoURL!)
                              : const AssetImage(AppImages.noUserPhoto) as ImageProvider<Object>,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
            title: Stack(
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
          return GestureDetector(
            onTap: () {
              Modular.to.pushNamed("/movieDetails", arguments: movieEntity.id);
            },
            child: Hero(
              tag: 'moviePoster_${movieEntity.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movieEntity.posterPath}',
                  fit: BoxFit.cover,
                ),
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
