import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  Future getPokemonList() async {
    var url = "https://pokeapi.co/api/v2/pokemon?limit=10&offset=0";
    var url1 =
        "https://raw.githubusercontent.com/Biuni/pokemongo-pokedex/master/pokedex.json";
    var response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/Biuni/pokemongo-pokedex/master/pokedex.json"));

    var json = jsonDecode(response.body);
    print(jsonDecode(response.body)['pokemon']);
    print("the service page");
    return json['pokemon'];
  }
}
