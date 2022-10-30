import 'dart:convert';

import 'package:rick_and_morty/models/character_model.dart';
import 'package:http/http.dart' as http;

class CharactersApi {
  final URL = "https://rickandmortyapi.com/api/character/?page=1";
  
  Future<List<Character>?> getAllCharacter() async{
    final response = await http.get(Uri.parse(URL));
    if(response.statusCode == 200){
      var character = jsonDecode(response.body)['results'] as List;
      return List<Character>.from(character.map((character) => Character.fromJson(character)));
    }else{
      return null;
    }
  }

}