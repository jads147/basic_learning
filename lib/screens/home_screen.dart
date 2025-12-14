import 'package:flutter/material.dart';
import 'detail_screen.dart'; // Importiert den Detail Screen
import '../widgets/custom_button.dart'; // Importiert unser Custom Button Widget

/// HOME SCREEN - Der erste Screen der App
///
/// StatelessWidget = Widget ohne eigenen Zustand
/// Perfekt für Screens, die sich nicht ändern (keine Counter, keine Eingaben, etc.)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // BUILD-METHODE
  // Beschreibt, wie der Screen aussehen soll
  @override
  Widget build(BuildContext context) {
    // SCAFFOLD = Grundgerüst einer Screen-Seite in Flutter
    // Bietet AppBar, Body, FloatingActionButton, Drawer, etc.
    return Scaffold(
      // APP BAR = Die obere Leiste mit Titel
      appBar: AppBar(
        title: const Text('Home Screen'),
        // Holt die Farbe aus dem App-Theme (siehe main.dart)
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      // BODY = Der Hauptinhalt des Screens
      body: Center(
        // Center = Zentriert sein Kind-Widget horizontal und vertikal
        child: Padding(
          // Padding = Fügt Abstand um sein Kind herum hinzu
          padding: const EdgeInsets.all(20.0), // 20px Abstand auf allen Seiten
          // COLUMN = Ordnet Kinder vertikal untereinander an
          child: Column(
            // mainAxisAlignment = Ausrichtung in Hauptrichtung (vertikal bei Column)
            mainAxisAlignment: MainAxisAlignment.center, // Zentriert vertikal
            // CHILDREN = Liste der Kinder-Widgets in der Column
            children: [
              // ==================== ICON ====================
              // Ein großes Home-Icon als visuelle Dekoration
              const Icon(
                Icons.home, // Das Icon (aus Material Icons)
                size: 80, // Größe 80px
                color: Colors.blue, // Blaue Farbe
              ),

              // SIZEBOX = Unsichtbares Widget für Abstand
              // Wird oft für Spacing zwischen Widgets verwendet
              const SizedBox(height: 30), // 30px vertikaler Abstand
              // ==================== TITEL ====================
              const Text(
                'Willkommen!',
                style: TextStyle(
                  fontSize: 32, // Große Schrift
                  fontWeight: FontWeight.bold, // Fettgedruckt
                ),
              ),

              const SizedBox(height: 15), // 15px Abstand
              // ==================== BESCHREIBUNG ====================
              const Text(
                'Dies ist ein einfaches Flutter UI Tutorial',
                textAlign: TextAlign.center, // Text zentriert ausrichten
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey, // Grauer Text
                ),
              ),

              const SizedBox(height: 50), // 50px Abstand vor dem Button
              // ==================== CUSTOM BUTTON ====================
              // Hier benutzen wir unser wiederverwendbares CustomButton Widget!
              CustomButton(
                text: 'Zum Detail Screen', // Text auf dem Button
                icon: Icons.arrow_forward, // Pfeil-Icon nach rechts
                // onPressed = Was passiert beim Klick?
                onPressed: () {
                  // NAVIGATION = Wechsel zu einem anderen Screen
                  // Navigator.push = Neuen Screen auf den "Stapel" legen
                  Navigator.push(
                    context, // Context wird für Navigation benötigt
                    // MaterialPageRoute = Standard-Übergang zwischen Screens
                    MaterialPageRoute(
                      // builder = Funktion, die den neuen Screen erstellt
                      builder: (context) => const DetailScreen(
                        // Parameter, die an DetailScreen übergeben werden
                        title: 'Mein Detail',
                        message: 'Du hast erfolgreich navigiert!',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
