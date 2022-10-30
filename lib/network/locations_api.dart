import 'dart:convert';

import 'package:rick_and_morty/models/location_model.dart';
import 'package:http/http.dart' as http;

class LocationsApi {
  final URL = "https://rickandmortyapi.com/api/location/?page=1";
  Future<List<Location>?> getAllLocation() async{
    final response = await http.get(Uri.parse(URL));
    if(response.statusCode == 200){
      var character = jsonDecode(response.body)['results'] as List;
      return List<Location>.from(character.map((character) => Location.fromJson(character)));
    }else{
      return null;
    }
  }

}