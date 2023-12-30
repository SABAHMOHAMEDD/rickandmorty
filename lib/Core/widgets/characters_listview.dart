import 'package:flutter/material.dart';

import '../../Features/Data/Model/characters_model.dart';
import 'character_item.dart';

class CharactersListView extends StatelessWidget {
  late CharactersModel allCharacters;
  late List<Character> searchedCharacters;
  bool isSearching = false;
  late TextEditingController searchTextController = TextEditingController();
  CharactersListView(
      {super.key,
      required this.isSearching,
      required this.searchTextController,required this.searchedCharacters,required this.allCharacters});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Column(
            children: [buildCharactersGridWidget()],
          ),
        ),
      ),
    );
  }

  Widget buildCharactersGridWidget() {
    return GridView.builder(
        itemCount: searchTextController.text.isNotEmpty
            ? searchedCharacters.length
            : allCharacters.results?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            childAspectRatio: 2 / 3),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return CharacterItem(
            character: searchTextController.text.isNotEmpty
                ? searchedCharacters[index]
                : allCharacters.results![index],
          );
        });
  }
}
