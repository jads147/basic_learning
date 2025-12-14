import 'package:flutter/material.dart';
import '../widgets/custom_button.dart'; // Importiert unser Custom Button Widget
import '../theme/windows98_theme.dart'; // Importiert Windows 98 Theme Widgets

/// DETAIL SCREEN - Der zweite Screen der App
///
/// StatelessWidget mit PARAMETERN!
/// Dieser Screen empfängt Daten vom vorherigen Screen (title und message)
class DetailScreen extends StatelessWidget {
  // EIGENSCHAFTEN
  // Diese werden vom HomeScreen übergeben, wenn navigiert wird

  /// Der Titel, der in der AppBar angezeigt wird
  final String title;

  /// Die Nachricht, die im Hauptbereich angezeigt wird
  final String message;

  // KONSTRUKTOR mit REQUIRED Parametern
  // Beim Erstellen MUSS title und message übergeben werden
  const DetailScreen({
    super.key,
    required this.title,   // MUSS übergeben werden
    required this.message, // MUSS übergeben werden
  });

  @override
  Widget build(BuildContext context) {
    // Prüfen, ob wir im Windows 98 Modus sind
    final isWin98Mode = Theme.of(context).useMaterial3 == false &&
        Theme.of(context).scaffoldBackgroundColor == Windows98Theme.win98Desktop;

    // SCAFFOLD = Grundgerüst des Screens
    return Scaffold(
      // APP BAR mit dynamischem Titel
      appBar: AppBar(
        // Der Titel kommt aus der übergebenen Variable 'title'
        // Nicht const, weil der Wert variabel ist!
        title: Text(title),
        backgroundColor: isWin98Mode
            ? Windows98Theme.win98Blue
            : Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: isWin98Mode ? Windows98Theme.win98White : null,
        // WICHTIG: Der Zurück-Button (<-) erscheint automatisch!
        // Flutter weiß, dass wir mit Navigator.push hierher gekommen sind
      ),

      // BODY = Hauptinhalt
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          // COLUMN = Vertikales Layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Vertikal zentriert

            children: [
              // ==================== SUCCESS ICON ====================
              // Grünes Häkchen-Icon als visuelle Bestätigung
              const Icon(
                Icons.check_circle, // Häkchen im Kreis
                size: 100,          // Sehr groß für Aufmerksamkeit
                color: Colors.green, // Grün = Erfolg/Positiv
              ),

              const SizedBox(height: 30),

              // ==================== MESSAGE TEXT ====================
              // Zeigt die übergebene Nachricht an
              Text(
                message, // Kommt vom HomeScreen!
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500, // Mittel-dick (zwischen normal und bold)
                ),
              ),

              const SizedBox(height: 20),

              // ==================== INFO CARD ====================
              // CARD = Material Design Container mit Schatten
              // Perfekt für zusammengehörige Informationen
              Card(
                elevation: 4, // Schattentiefe (höher = mehr Schatten)

                child: Padding(
                  padding: const EdgeInsets.all(20.0),

                  // Column innerhalb der Card
                  child: Column(
                    children: [
                      // Überschrift in der Card
                      const Text(
                        'Dies ist ein Detail Screen',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Beschreibungstext in der Card
                      const Text(
                        'Hier können weitere Informationen angezeigt werden.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // ==================== ZURÜCK BUTTON ====================
              // Verwendet Win98Button im Windows 98 Modus, sonst CustomButton
              if (isWin98Mode)
                Win98Button(
                  text: 'Zurück',
                  icon: Icons.arrow_back, // Pfeil nach links
                  onPressed: () {
                    // NAVIGATION ZURÜCK
                    // Navigator.pop = Entfernt den aktuellen Screen vom "Stapel"
                    // → Kehrt zum vorherigen Screen zurück (HomeScreen)
                    Navigator.pop(context);
                  },
                )
              else
                CustomButton(
                  text: 'Zurück',
                  icon: Icons.arrow_back, // Pfeil nach links

                  // onPressed = Was passiert beim Klick?
                  onPressed: () {
                    // NAVIGATION ZURÜCK
                    // Navigator.pop = Entfernt den aktuellen Screen vom "Stapel"
                    // → Kehrt zum vorherigen Screen zurück (HomeScreen)
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
