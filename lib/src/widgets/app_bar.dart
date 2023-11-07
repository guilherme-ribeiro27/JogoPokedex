import "dart:ui";

import "package:flutter/material.dart";

AppBar appBar() {
  return AppBar(
    // backgroundColor: const Color(0x27273f),
    backgroundColor: const Color.fromARGB(255, 39, 39, 63),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
    leading: InkWell(
      onTap: () {},
      child: const Icon(
        Icons.subject,
        color: Colors.white,
        size: 40,
      ),
    ),
    actions: [
      InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.notifications,
            size: 30,
          ),
        ),
      ),
    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child:  Container(
        child: const Text(
          'Gamedex', 
          style: TextStyle(
            fontFamily: 'PokemonHollow', 
            fontSize: 30, 
            overflow: TextOverflow.clip,
            color: Colors.yellow

          )
        ),
      )
    ),
  );
}

// PreferredSize(
//           preferredSize: const Size(double.infinity, 56),
//           child: AppBar(
//             title: Text(
//               'Gamedex',
//               style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
//             ),
//             centerTitle: true,
//             backgroundColor: Theme.of(context).colorScheme.background,
//             shadowColor: Colors.transparent,
//             leading: IconButton(
//               padding: EdgeInsets.zero,
//               icon: Icon(
//                 Icons.menu,
//                 color: Theme.of(context).colorScheme.onBackground,
//               ),
//               onPressed: () {},
//             ),
//           )),
