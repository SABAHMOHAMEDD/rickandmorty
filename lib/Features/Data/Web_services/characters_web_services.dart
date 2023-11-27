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
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60));
    dio = Dio(options);
  }

  Future<List<CharactersModel>> getAllCharacters() async {
    Response response = await dio.get('character');
    if (kDebugMode) {
      print(response.data.toString());
    }
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    return response.data;
    try {} catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return [];
    }
  }
}
