import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rick_and_morty/Core/constants/strings.dart';

import '../Model/characters_model.dart';

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,



    );
    dio = Dio(options);
  }

  Future<dynamic> getAllCharacters() async {
    Response response = await dio.get('character');
    return response.data;
  }
}
