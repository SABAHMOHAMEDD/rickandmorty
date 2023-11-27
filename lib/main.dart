import 'package:flutter/material.dart';
import 'package:rick_and_morty/Core/app_router.dart';

void main() {
  runApp(RickMortyApp(
    appRouter: AppRouter(),
  ));
}

class RickMortyApp extends StatelessWidget {
  final AppRouter appRouter;
  const RickMortyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
