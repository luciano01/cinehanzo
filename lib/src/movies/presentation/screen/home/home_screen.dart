import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../state/home/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeStore = Modular.get<HomeState>();

  @override
  void initState() {
    homeStore.isLoading.addListener(_listenerIsLoading);
    super.initState();
  }

  @override
  void dispose() {
    homeStore.isLoading.removeListener(_listenerIsLoading);
    super.dispose();
  }

  void _listenerIsLoading() {
    if (homeStore.isLoading.value == true) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Center(child: CircularProgressIndicator()),
          );
        },
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        title: const Text('HomeScreen'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
            ),
            onPressed: () => homeStore.getMovies(),
          ),
        ],
      ),
    );
  }
}
