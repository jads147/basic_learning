import 'package:flutter/material.dart';

/// CUSTOM BUTTON WIDGET
///
/// Dies ist ein wiederverwendbares Widget, das in der ganzen App benutzt werden kann.
/// Ein Widget ist wie ein Baustein - einmal erstellt, überall nutzbar!
///
/// StatelessWidget = Widget ohne eigenen Zustand (State)
/// Das bedeutet: Es ändert sich nicht selbst, sondern zeigt nur an, was ihm übergeben wird
class CustomButton extends StatelessWidget {
  // EIGENSCHAFTEN (Properties)
  // Diese werden von außen übergeben, wenn das Widget benutzt wird
  // 'final' bedeutet: Kann nach Erstellung nicht mehr geändert werden

  /// Der Text, der auf dem Button angezeigt wird
  final String text;

  /// Das Icon, das links vom Text angezeigt wird
  /// IconData ist der Typ für Flutter Icons (z.B. Icons.home, Icons.arrow_forward)
  final IconData icon;

  /// Die Funktion, die ausgeführt wird, wenn der Button gedrückt wird
  /// VoidCallback = Eine Funktion ohne Parameter und ohne Rückgabewert
  final VoidCallback onPressed;

  // KONSTRUKTOR
  // Wird aufgerufen, wenn das Widget erstellt wird
  // 'required' bedeutet: Dieser Parameter MUSS übergeben werden
  const CustomButton({
    super.key, // Key für Flutter's Widget-Identifikation (Standard)
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  // BUILD-METHODE
  // Diese Methode wird von Flutter aufgerufen, um das Widget zu zeichnen
  // Sie gibt zurück, WIE das Widget aussehen soll
  @override
  Widget build(BuildContext context) {
    // ElevatedButton.icon = Ein Material Design Button mit Icon und Text
    // "Elevated" = Erhöht, wirft einen Schatten
    return ElevatedButton.icon(
      // Was passiert beim Klick? → Die übergebene Funktion wird ausgeführt
      onPressed: onPressed,

      // Das Icon links vom Text
      icon: Icon(icon),

      // Der Text auf dem Button
      label: Text(
        text,
        style: const TextStyle(fontSize: 18), // Schriftgröße 18
      ),

      // STYLE = Aussehen des Buttons
      // WICHTIG: Verwendet jetzt das Theme statt hardcodierte Farben!
      style: ElevatedButton.styleFrom(
        // Innenabstand: 30px links/rechts, 15px oben/unten
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),

        // NEU: Farben aus dem aktuellen Theme holen
        // Modern Theme → Lila (primaryColor)
        // Windows 98 Theme → Grau (win98Gray)
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,

        // Form aus dem Theme übernehmen
        // Modern Theme → abgerundet (12px)
        // Windows 98 Theme → eckig (0px)
        shape: Theme.of(context).elevatedButtonTheme.style?.shape?.resolve({}),
      ),
    );
  }
}
