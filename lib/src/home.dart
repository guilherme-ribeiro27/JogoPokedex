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
  int certos = 0;
  int errados = 0;
  int total = 0;
  bool initGame = true;
  TextStyle headerStyle = const TextStyle(
    fontSize: 26,
    // fontWeight: FontWeight.bold,
  );
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
        if (snapshot.hasData && initGame) {
          var pokemons = snapshot.data as List<Pokemon>;
          pokemons.shuffle();
          var randomPokemons = pokemons.take(4).toList();
          var randomNumber = Random().nextInt(4);
          var pokemon = randomPokemons[randomNumber];
          if(total == 10){
            setState(() {
              initGame = false;
            });
          }
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Certos: $certos', style:headerStyle),
                        Text('Errados: $errados',style:headerStyle),
                      ],
                    
                  ),
                  Image.network(pokemon.image!),
                  Column(
                    children: randomPokemons.map((e) => 
                      TextButton(
                        
                        onPressed: (){
                          if(e.name == pokemon.name){
                            setState(() {
                              certos++;
                              total++;
                            });
                          }else{
                            setState(() {
                              errados ++;
                              total++;
                            });
                          }
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(const Size(double.infinity, 60)),
                          backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                          elevation: MaterialStateProperty.all(5)
                        ),
                        child:Text(e.name, style: const TextStyle(color: Colors.white),),
                      )
                    ).toList(),
                  )
                ],
              ),
            ),
          );
        }else{
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  const Text('Iniciar Jogo?'),

                ],
              ),
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
    final List<Pokemon> pokemons = [];
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));
    if (response.statusCode == 200) {
      final pokemonList = jsonDecode(response.body);
      for(final item in pokemonList['results']) {
        pokemons.add(Pokemon.fromJson(item));
      }
      return pokemons;
    } else {
      throw Exception('Failed to load pokemons');
    }
  }

}
