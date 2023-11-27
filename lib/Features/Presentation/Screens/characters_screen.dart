import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/Core/constants/colors.dart';
import 'package:rick_and_morty/Core/widgets/animated_loading.dart';
import 'package:rick_and_morty/Features/Business_logic/Cubit/characters_states.dart';
import '../../Data/Model/characters_model.dart';

import '../../../Core/widgets/character_item.dart';
import '../../Business_logic/Cubit/characters_cubit.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<CharactersModel> allCharacters;
  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    super.initState();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersStates>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = state.characters;
        return buildLoadedCharactersWidget();
      } else {
        return const AppAnimatedLoading();
      }
    });
  }

  Widget buildLoadedCharactersWidget() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [buildCharactersGridWidget()],
        ),
      ),
    );
  }

  Widget buildCharactersGridWidget() {
    return GridView.builder(
        itemCount: allCharacters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            childAspectRatio: 2 / 3),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return CharacterItem(
            character: allCharacters[index].results![index],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kAppBarColor,
          title: const Text(
            "Characters",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        body: buildBlocWidget());
  }
}
