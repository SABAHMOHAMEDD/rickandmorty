import 'package:flutter/material.dart';

import '../../Features/Data/Model/characters_model.dart';
import '../constants/colors.dart';

class ScoffoldWithSearchAppBar extends StatefulWidget {
  final Widget body;
  late final List<Character> allCharacters;
  late final List<Character> searchedCharacters;
  var searchTextController = TextEditingController();
  bool isSearching;

  ScoffoldWithSearchAppBar(
      {super.key,
      required this.body,
      required this.allCharacters,
      required this.searchedCharacters,
      required this.searchTextController,
      required this.isSearching});

  @override
  State<ScoffoldWithSearchAppBar> createState() =>
      _ScoffoldWithSearchAppBarState();
}

class _ScoffoldWithSearchAppBarState extends State<ScoffoldWithSearchAppBar> {
  Widget searchFieldWidget() {
    return TextField(
      controller: widget.searchTextController,
      cursorColor: AppColors.kPrimaryColor,
      decoration: const InputDecoration(
          hintText: "Find a character..",
          border: InputBorder.none,
          hintStyle: TextStyle(color: AppColors.kPrimaryColor, fontSize: 18)),
      onChanged: (searchedCharacter) {
        addSearchedCharactersToSearchedList(searchedCharacter);
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>");
        print(searchedCharacter);
      },
      style: const TextStyle(color: AppColors.kPrimaryColor, fontSize: 18),
    );
  }

  void addSearchedCharactersToSearchedList(String searchedCharacter) {
    widget.searchedCharacters = widget.allCharacters!
        .where((character) =>
            character.name!.toLowerCase().contains(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> appBarAction() {
    if (widget.isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: AppColors.kPrimaryColor,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearching,
            icon: const Icon(
              Icons.search,
              color: AppColors.kPrimaryColor,
            ))
      ];
    }
  }

  void _startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      widget.isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      widget.isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      widget.searchTextController.clear();
    });
  }

  Widget appBarTitle() {
    return const Text("Characters");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: widget.isSearching
            ? const BackButton(
                color: AppColors.kPrimaryColor,
              )
            : Container(),
        title: widget.isSearching ? searchFieldWidget() : appBarTitle(),
        actions: appBarAction(),
      ),
    );
  }
}
