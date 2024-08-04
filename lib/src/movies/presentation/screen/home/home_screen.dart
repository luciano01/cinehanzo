import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/core.dart';
import '../../state/home/home.dart';
import 'home_movies_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeStore = Modular.get<HomeState>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: homeStore,
      builder: (_, __) {
        return Scaffold(
          backgroundColor: AppColors.white,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: homeStore.currentScreenIndex,
            onTap: (value) => homeStore.updateScreenIndex(value),
            backgroundColor: AppColors.white,
            elevation: 0,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie_outlined),
                activeIcon: Icon(Icons.movie),
                label: 'Filmes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                activeIcon: Icon(Icons.search),
                label: 'Pesquisar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                activeIcon: Icon(Icons.account_circle),
                label: 'Perfil',
              ),
            ],
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: homeStore.pageController,
            onPageChanged: (value) => homeStore.updateScreenIndex(value),
            children: const [
              HomeMoviesScreen(),
              Center(
                child: Text('Pesquisar'),
              ),
              Center(
                child: Text('Perfil'),
              ),
            ],
          ),
        );
      },
    );
  }
}
