import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:rick_and_morty/Core/constants/colors.dart';
import 'package:rick_and_morty/Core/widgets/animated_loading.dart';
import 'package:rick_and_morty/Features/Business_logic/Cubit/characters_states.dart';
import '../../../Core/widgets/characters_listview.dart';
import '../../Data/Model/characters_model.dart';

import '../../Business_logic/Cubit/characters_cubit.dart';
import 'no_internet_connection.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late CharactersModel allCharacters;
  List<Character>? searchedCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    // BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    super.initState();
  }

  Widget searchFieldWidget() {
    return TextField(
      controller: _searchTextController,
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
    searchedCharacters = allCharacters.results!
        .where((character) =>
            character.name!.toLowerCase().contains(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> appBarAction() {
    if (_isSearching) {
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
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  Widget appBarTitle() {
    return const Text("Characters");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: _isSearching
              ? const BackButton(
                  color: AppColors.kPrimaryColor,
                )
              : Container(),
          title: _isSearching ? searchFieldWidget() : const Text("Characters"),
          actions: appBarAction(),
        ),
        body: OfflineBuilder(
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              BlocProvider.of<CharactersCubit>(context).getAllCharacters();

              return BlocBuilder<CharactersCubit, CharactersStates>(
                  builder: (context, state) {
                if (state is CharactersLoaded) {
                  allCharacters = state.characters;
                  return CharactersListView(
                    isSearching: _isSearching,
                    searchTextController: _searchTextController,
                    searchedCharacters: searchedCharacters ?? [],
                    allCharacters: allCharacters,
                  );
                } else {
                  return const AppAnimatedLoading();
                }
              });
            } else {
              return const NoInternetConnection();
            }
          },
          child: const NoInternetConnection(),
        ));
  }
}
