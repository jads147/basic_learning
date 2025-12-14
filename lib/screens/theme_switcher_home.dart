import 'package:flutter/material.dart';
import 'detail_screen.dart';
import '../widgets/custom_button.dart';
import '../theme/windows98_theme.dart';

/// THEME SWITCHER HOME SCREEN
///
/// Home Screen mit Button zum Umschalten zwischen modernem und Retro Theme
class ThemeSwitcherHome extends StatelessWidget {
  final bool isRetroMode;
  final VoidCallback onToggleTheme;

  const ThemeSwitcherHome({
    super.key,
    required this.isRetroMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isRetroMode ? 'Windows 98 Modus' : 'Moderner Modus'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ==================== ICON ====================
              Icon(
                isRetroMode ? Icons.computer : Icons.smartphone,
                size: 80,
                color: isRetroMode
                    ? Windows98Theme.win98Black
                    : Colors.blue,
              ),

              const SizedBox(height: 30),

              // ==================== TITEL ====================
              Text(
                isRetroMode ? 'Willkommen zu Windows 98!' : 'Willkommen!',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              // ==================== BESCHREIBUNG ====================
              Text(
                isRetroMode
                    ? 'Nostalgisches Retro-Design mit harten Kanten'
                    : 'Modernes Design mit abgerundeten Ecken',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: 50),

              // ==================== THEME TOGGLE BUTTON ====================
              // WICHTIG: Verwendet Win98Button im Retro-Modus!
              if (isRetroMode)
                Win98Button(
                  text: 'Zurück zum modernen Design',
                  icon: Icons.arrow_forward,
                  onPressed: onToggleTheme,
                )
              else
                CustomButton(
                  text: 'Aktiviere Windows 98 Modus',
                  icon: Icons.computer,
                  onPressed: onToggleTheme,
                ),

              const SizedBox(height: 20),

              // ==================== NAVIGATION BUTTON ====================
              if (isRetroMode)
                Win98Button(
                  text: 'Zum Detail Screen',
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScreen(
                          title: 'Detail',
                          message: 'Windows 98 Style!',
                        ),
                      ),
                    );
                  },
                )
              else
                CustomButton(
                  text: 'Zum Detail Screen',
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScreen(
                          title: 'Mein Detail',
                          message: 'Du hast erfolgreich navigiert!',
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(height: 40),

              // ==================== INFO PANEL ====================
              // Zeigt ein Panel im jeweiligen Theme-Style
              if (isRetroMode)
                Win98Panel(
                  child: Column(
                    children: [
                      const Text(
                        'Windows 98 Features:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text('✓ Harte Kanten'),
                      const Text('✓ 3D Button Effekte'),
                      const Text('✓ Klassisches Grau'),
                      const Text('✓ Desktop Türkis'),
                    ],
                  ),
                )
              else
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Modernes Design Features:',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        const Text('✓ Abgerundete Ecken'),
                        const Text('✓ Material Design'),
                        const Text('✓ Moderne Farben'),
                        const Text('✓ Schatten-Effekte'),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================
// WAS DU GELERNT HAST
// ============================================
//
// 1. CONDITIONAL RENDERING (if-else in Widget-Tree)
//    - Verschiedene Widgets basierend auf Bedingungen anzeigen
//
// 2. STATE MANAGEMENT
//    - isRetroMode wird von parent (main) verwaltet
//    - onToggleTheme callback zum Ändern des States
//
// 3. THEME REAKTIVITÄT
//    - Theme.of(context) holt das aktuelle Theme
//    - Automatische Anpassung aller Widgets
//
// 4. CUSTOM WIDGETS für verschiedene Themes
//    - Win98Button für Retro-Look
//    - CustomButton für Modern-Look
