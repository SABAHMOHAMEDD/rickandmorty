import 'package:rick_and_morty/Features/Data/Web_services/characters_web_services.dart';

import '../Model/characters_model.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;
  CharactersRepository(this.charactersWebServices);

  Future<List<CharactersModel>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters;
}}
