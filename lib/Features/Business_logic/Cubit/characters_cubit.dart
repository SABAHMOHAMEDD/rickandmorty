import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/Features/Business_logic/Cubit/characters_states.dart';

import '../../Data/Model/characters_model.dart';
import '../../Data/Repository/characters_repository.dart';

class CharactersCubit extends Cubit<CharactersStates> {
  CharactersRepository charactersRepository;
  late List<CharactersModel> characters;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<CharactersModel> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters!));
      this.characters = characters;
    });
    return characters;
  }
}
