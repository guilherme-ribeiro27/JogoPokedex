import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jogo_pokedex/src/classes/pokemon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Pokemon>> pokemons;
  final int certos = 0;
  final int errados = 0;
  @override
  void initState() {
    super.initState();
    pokemons = fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pokemons,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return const Center(
            child: CircularProgressIndicator(),
          );
        if (snapshot.hasData) {
          var pokemons = snapshot.data as List<Pokemon>;
          // if (pokemons.isEmpty)
          //   return const Center(child: Text('Nenhum pokemon encontrado'));
          print(snapshot);
          var randomPokemons = pokemons.take(4).toList();
          var randomNumber = Random().nextInt(4);
          var pokemon = randomPokemons[randomNumber];
          return Scaffold(
            body: Column(
              children: [
                const Row(
                  children: [
                    Text('Certos: '),
                    Text('Errados: '),
                  ],
                ),
                Image.network(pokemon.image!),
                Column(
                  children: randomPokemons.map((e) => Text(e.name!)).toList(),
                )
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  Future<List<Pokemon>> fetchPokemons() async {
    late List<Pokemon> pokemons;
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final lista = PokemonList.fromJson(result);
      // List<String> urls = results.
      pokemons = [];
      for (PokemonMinimal pokemon in lista.pokemons!) {
        var fetchPokemon = await http.get(Uri.parse(pokemon.url!));
        if (fetchPokemon.statusCode == 200) {
          var pokemonResult = jsonDecode(fetchPokemon.body);
          var pokemon = Pokemon.fromJson(pokemonResult);
          print(pokemon.name);
          pokemons.add(pokemon);
        }
      }
      // lista.pokemons!.map((pokemon)async{
      //   var fetchPokemon = await http.get(Uri.parse(pokemon.url!));
      //   if (fetchPokemon.statusCode == 200) {
      //     var pokemonResult = jsonDecode(fetchPokemon.body);
      //     var pokemon = Pokemon.fromJson(pokemonResult);
      //     print(pokemon.name);
      //     pokemons.add(pokemon);
      //   }
      // }).toList();
      // lista.pokemons!.map((pokemon) async {
      //   var fetchPokemon = await http.get(Uri.parse(pokemon.url!));
      //   if (fetchPokemon.statusCode == 200) {
      //     var pokemonResult = jsonDecode(fetchPokemon.body);
      //     var pokemon = Pokemon.fromJson(pokemonResult);
      //     print(pokemon.name);
      //     pokemons.add(pokemon);
      //   }
      // });
      // pokemons.add(Pokemon(id: 1, name: 'Bulbasaur', image: ''));
      // return result['results'];
      return pokemons;
    } else {
      throw Exception('Failed to load pokemons');
    }
  }

  Future<List<Pokemon>> fetchPokemonData(List<String> urls) async {
    List<Pokemon> pokemons = [];
    for (var url in urls) {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        var pokemon = Pokemon.fromJson(result);
        pokemons.add(pokemon);
      }
    }
    return pokemons;
  }
}
