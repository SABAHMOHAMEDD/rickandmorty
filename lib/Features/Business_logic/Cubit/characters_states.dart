import '../../Data/Model/characters_model.dart';

abstract class CharactersStates {}

class CharactersInitial extends CharactersStates {}

class CharactersLoaded extends CharactersStates {
  final List<CharactersModel> characters;

  CharactersLoaded(this.characters);
}
