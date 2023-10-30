class Pokemon {
  int? id;
  String? name;
  String? image;
  Pokemon({this.id, this.name, this.image});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['sprites']['other']['official-artwork']['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
  
    return data;
  }
}

class PokemonList {
  List<PokemonMinimal>? pokemons;

  PokemonList({this.pokemons});

  PokemonList.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      pokemons = <PokemonMinimal>[];
      json['results'].forEach((v) {
        pokemons!.add(PokemonMinimal.fromJson(v));
      });
    }
  }
}
class PokemonMinimal{
  String? name;
  String? url;
  PokemonMinimal({this.name, this.url});

  PokemonMinimal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
