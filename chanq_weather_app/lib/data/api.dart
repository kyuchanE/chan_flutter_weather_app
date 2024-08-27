import 'package:chanq_weather_app/data/dto/character_dto.dart';
import 'package:dio/dio.dart';

abstract class Api {
  Future<List<CharacterDto>> loadCharacters({int page = 0});
}

class ApiImpl implements Api {
  final dio = Dio();

  @override
  Future<List<CharacterDto>> loadCharacters({int page = 0}) async {
    try {
      final response =
          await dio.get('https://rickandmortyapi.com/api/character?page=$page');
      print('page');
      final list = (response.data!['results'] as List<dynamic>)
          .map((e) => CharacterDto.fromMap(e))
          .toList();
      return list;
    } on DioException catch (e) {
      print(e);
    }
    return [];
  }
}
