import 'package:flutter/material.dart';
import 'package:jogo_pokedex/src/utils/constants.dart';

class GamesList extends StatelessWidget {
  const GamesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Positioned(
                  bottom: -25,
                  right: -3,
                  child: Image(
                    image: AssetImage('assets/icons/pokeball.png'),
                    width: 100,
                    colorBlendMode: BlendMode.darken,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Theme.of(context).colorScheme.background,;
                    // image: const DecorationImage(
                    //   image: AssetImage('assets/icons/splash_logo.png'),
                    //   alignment: Alignment.bottomRight,
                    //   colorFilter: ColorFilter.mode(Colors.grey, BlendMode.darken),
                    // ),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Theme.of(context).colorScheme.shadow,
                    //     blurRadius: 2,
                    //     offset: const Offset(1, 5),
                    //   )
                    // ],
                    borderRadius: BorderRadius.circular(12)),

                  padding: const EdgeInsets.all(38.0),
                  child: Text(games[index]),
                )
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 20),
          itemCount: games.length),
    );
  }
}
