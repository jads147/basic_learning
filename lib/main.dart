// ============================================
// IMPORTS - Bibliotheken einbinden
// ============================================
import 'package:flutter/material.dart'; // Flutter Material Design Framework
import 'screens/home_screen.dart'; // Unser Home Screen
import 'theme/app_theme.dart';

// ============================================
// MAIN FUNKTION - Der Startpunkt der App
// ============================================
// Diese Funktion wird als erstes ausgeführt, wenn die App startet
void main() {
  // runApp() startet die Flutter App
  // Sie nimmt ein Widget entgegen, das die gesamte App repräsentiert
  runApp(const MyApp());
}

// ============================================
// MY APP - Die Root-Komponente der App
// ============================================
// Dies ist das oberste Widget der gesamten App
// Es definiert grundlegende Einstellungen wie Theme, Navigation, etc.
//
// StatelessWidget = Widget ohne eigenen Zustand
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // BUILD-METHODE
  // Wird von Flutter aufgerufen, um die App zu erstellen
  @override
  Widget build(BuildContext context) {
    // MATERIAL APP = Der Container für Material Design Apps
    // Dies ist IMMER das Root-Widget einer Flutter Material App
    return MaterialApp(
      // ============================================
      // APP KONFIGURATION
      // ============================================

      // Titel der App (wird z.B. im Task-Switcher angezeigt)
      title: 'Flutter UI Tutorial',

      theme: AppTheme.lightTheme, // Statt ThemeData(...)
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // HOME = Der Start-Screen der App
      // Dies ist der erste Screen, der angezeigt wird
      home: const HomeScreen(),
    );
  }
}

// ============================================
// ZUSAMMENFASSUNG
// ============================================
// 1. main() startet die App
// 2. MyApp wird als Root-Widget erstellt
// 3. MaterialApp konfiguriert die grundlegenden Einstellungen
// 4. HomeScreen wird als erster Screen angezeigt
