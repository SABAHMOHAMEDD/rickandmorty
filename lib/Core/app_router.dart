import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/Features/Business_logic/Cubit/characters_cubit.dart';
import 'package:rick_and_morty/Features/Data/Repository/characters_repository.dart';
import 'package:rick_and_morty/Features/Data/Web_services/characters_web_services.dart';
import 'package:rick_and_morty/Features/Presentation/Screens/characters_screen.dart';

import '../Features/Presentation/Screens/character_details_screen.dart';
import 'constants/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => charactersCubit,
                child: const CharactersScreen()));
      case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
    }
  }
}
