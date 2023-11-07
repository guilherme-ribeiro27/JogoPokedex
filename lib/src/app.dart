import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jogo_pokedex/src/home.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // primaryColor: Colors.red,
        colorSchemeSeed: null,
        // primaryColor: Colors.red,
        // primarySwatch: null
        // primaryColor: Colors.yellow,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      // debugShowMaterialGrid: true,
      // darkTheme: ThemeData.light(),
      // debugShowMaterialGrid: true,
      home: const Home(),
    );
  }
}
