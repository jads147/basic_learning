// ============================================
// THEME SWITCHER APP
// ============================================
// App mit Button zum Umschalten zwischen modernem und Windows 98 Design!

import 'package:flutter/material.dart';
import 'screens/theme_switcher_home.dart';
import 'theme/app_theme.dart';
import 'theme/windows98_theme.dart';

void main() {
  runApp(const ThemeSwitcherApp());
}

/// APP mit THEME SWITCHER
///
/// Diese App kann zwischen verschiedenen Themes wechseln:
/// - Modern Theme (unser AppTheme)
/// - Windows 98 Retro Theme
class ThemeSwitcherApp extends StatefulWidget {
  const ThemeSwitcherApp({super.key});

  @override
  State<ThemeSwitcherApp> createState() => _ThemeSwitcherAppState();
}

class _ThemeSwitcherAppState extends State<ThemeSwitcherApp> {
  // STATE: Welches Theme ist aktiv?
  bool isRetroMode = false;

  // Funktion zum Umschalten des Themes
  void toggleTheme() {
    setState(() {
      isRetroMode = !isRetroMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Theme Switcher',

      // WICHTIG: Theme wechselt basierend auf isRetroMode!
      theme: isRetroMode
        ? Windows98Theme.theme      // Windows 98 Theme
        : AppTheme.lightTheme,       // Modernes Theme

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

      // Home Screen mit Theme-Toggle-Funktion
      home: ThemeSwitcherHome(
        isRetroMode: isRetroMode,
        onToggleTheme: toggleTheme,
      ),
    );
  }
}

// ============================================
// WIE ES FUNKTIONIERT
// ============================================
//
// 1. StatefulWidget: App hat einen State (isRetroMode)
// 2. isRetroMode = false → Modernes Theme
//    isRetroMode = true → Windows 98 Theme
// 3. Button ruft toggleTheme() auf
// 4. toggleTheme() ändert isRetroMode und ruft setState()
// 5. setState() triggert Rebuild → Theme wechselt!
//
// Das ist REAKTIVE Programmierung in Flutter!
