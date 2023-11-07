import 'package:flutter/material.dart';
import 'package:jogo_pokedex/src/utils/constants.dart';
import 'package:jogo_pokedex/src/widgets/app_bar.dart';
import 'package:jogo_pokedex/src/widgets/games_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp),
              label: 'Profile',
              backgroundColor: Colors.red,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Jogos',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize:
                        Theme.of(context).textTheme.titleLarge!.fontSize! + 20,
                    fontWeight: FontWeight.w100),
                    textAlign: TextAlign.start,
              ),
              const SizedBox(height: 20),
              const GamesList(),
            ],
          ),
        ));
  }
}
