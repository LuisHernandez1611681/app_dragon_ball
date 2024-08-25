import 'dart:convert';

import 'package:app_dragon_ball/config/config.dart';
import 'package:app_dragon_ball/features/dragonball/data/models/character_model.dart';
import 'package:http/http.dart' as http;

class DragonballRemoteDataSource {
  final http.Client client;

  DragonballRemoteDataSource(this.client);

  Future<List<CharacterModel>> fetchCharacters() async {
    final response = await client.get(Uri.parse('${Config.apiUrl}characters?page=2&limit=5'));

    if(response.statusCode == 200) {
      final Map<String, dynamic> res = jsonDecode(response.body);
      final List<dynamic> jsonList = res['items'];
      return jsonList.map((json) => CharacterModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}