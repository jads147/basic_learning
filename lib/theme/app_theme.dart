import 'package:flutter/material.dart';

/// APP THEME - Dein eigenes Design-System
///
/// Hier definierst du das Aussehen der GESAMTEN App an EINEM Ort!
/// Alle Widgets verwenden automatisch diese Farben, Schriften, etc.
///
/// VORTEIL: Änderst du hier eine Farbe, ändert sie sich in der ganzen App!
class AppTheme {
  // ============================================
  // FARBEN - Deine eigene Farbpalette
  // ============================================
  // Definiere hier alle Farben, die deine App verwendet
  // So bleibst du konsistent und kannst alles zentral ändern

  static const Color primaryColor = Color(0xFF6200EE);    // Lila - Hauptfarbe
  static const Color secondaryColor = Color(0xFF03DAC6);  // Türkis - Akzentfarbe
  static const Color backgroundColor = Color(0xFFF5F5F5); // Hellgrau - Hintergrund
  static const Color surfaceColor = Colors.white;         // Weiß - Cards, etc.
  static const Color errorColor = Color(0xFFB00020);      // Rot - Fehler

  // Text-Farben
  static const Color textPrimaryColor = Color(0xFF000000);   // Schwarz
  static const Color textSecondaryColor = Color(0xFF757575); // Grau

  // ============================================
  // LIGHT THEME - Helles Design
  // ============================================
  // Dies ist das Standard-Theme deiner App
  static ThemeData lightTheme = ThemeData(
    // Material 3 aktivieren (neuestes Design-System)
    useMaterial3: true,

    // ==================== FARBSCHEMA ====================
    // Das ColorScheme definiert ALLE Farben der App
    colorScheme: ColorScheme.light(
      primary: primaryColor,       // Hauptfarbe (Buttons, AppBar, etc.)
      secondary: secondaryColor,   // Akzentfarbe (Highlights, FAB, etc.)
      surface: surfaceColor,       // Karten, Dialoge, Menüs
      error: errorColor,           // Fehlermeldungen
      onPrimary: Colors.white,     // Text AUF primary-Farbe
      onSecondary: Colors.black,   // Text AUF secondary-Farbe
      onSurface: textPrimaryColor, // Text AUF surface-Farbe
    ),

    // ==================== SCAFFOLDS ====================
    // Hintergrundfarbe aller Screens
    scaffoldBackgroundColor: backgroundColor,

    // ==================== APP BAR THEME ====================
    // Aussehen ALLER AppBars in der App
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,    // Lila Hintergrund
      foregroundColor: Colors.white,    // Weißer Text
      elevation: 2,                     // Leichter Schatten
      centerTitle: true,                // Titel zentriert
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    // ==================== CARD THEME ====================
    // Aussehen ALLER Cards in der App
    cardTheme: CardThemeData(
      color: surfaceColor,
      elevation: 3,                      // Schatten
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Abgerundete Ecken
      ),
      margin: const EdgeInsets.all(8),
    ),

    // ==================== ELEVATED BUTTON THEME ====================
    // Aussehen ALLER ElevatedButtons in der App
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,    // Lila Hintergrund
        foregroundColor: Colors.white,    // Weißer Text
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 3,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // ==================== TEXT THEME ====================
    // Aussehen ALLER Texte in der App
    textTheme: const TextTheme(
      // Große Überschriften
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      ),
      // Mittlere Überschriften
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      ),
      // Kleine Überschriften
      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      // Normaler Text
      bodyLarge: TextStyle(
        fontSize: 16,
        color: textPrimaryColor,
      ),
      // Kleinerer Text
      bodyMedium: TextStyle(
        fontSize: 14,
        color: textSecondaryColor,
      ),
    ),

    // ==================== ICON THEME ====================
    // Aussehen ALLER Icons in der App
    iconTheme: const IconThemeData(
      color: primaryColor,
      size: 24,
    ),

    // ==================== INPUT DECORATION THEME ====================
    // Aussehen ALLER TextField / TextFormField in der App
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
    ),
  );

  // ============================================
  // DARK THEME - Dunkles Design (Optional)
  // ============================================
  // Für Dark Mode - automatisch verwendet, wenn User Dark Mode aktiviert hat
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: const Color(0xFF1E1E1E),
      error: errorColor,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
    ),
  );
}

// ============================================
// WIE DU ES BENUTZT
// ============================================
//
// 1. In main.dart:
//    MaterialApp(
//      theme: AppTheme.lightTheme,
//      darkTheme: AppTheme.darkTheme,  // Optional für Dark Mode
//      ...
//    )
//
// 2. Im Code Farben verwenden:
//    Color myColor = Theme.of(context).colorScheme.primary;
//
// 3. Text-Styles verwenden:
//    Text('Hallo', style: Theme.of(context).textTheme.headlineLarge)
//
// 4. VORTEIL: Änderst du eine Farbe hier, ändert sie sich ÜBERALL!
