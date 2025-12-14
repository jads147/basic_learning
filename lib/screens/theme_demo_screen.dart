import 'package:flutter/material.dart';

/// THEME DEMO SCREEN
///
/// Dieser Screen zeigt, wie du auf Theme-Farben und -Styles zugreifst
/// und wie alles automatisch einheitlich aussieht
class ThemeDemoScreen extends StatelessWidget {
  const ThemeDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ==================== APP BAR ====================
      // Verwendet AUTOMATISCH die Farben aus dem Theme!
      appBar: AppBar(
        title: const Text('Theme Demo'),
        // backgroundColor kommt automatisch aus AppBarTheme
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ==================== ÜBERSCHRIFT ====================
            // Text mit Theme-Style
            Text(
              'Design-System Demo',
              style: Theme.of(context).textTheme.headlineLarge,
              // ↑ Verwendet den headlineLarge-Style aus dem Theme
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // ==================== FARBPALETTE ====================
            Text(
              'Farbpalette',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 15),

            // Zeigt die Primary Color
            _ColorBox(
              label: 'Primary Color',
              color: Theme.of(context).colorScheme.primary,
              // ↑ Holt die Primary-Farbe aus dem Theme
            ),

            // Zeigt die Secondary Color
            _ColorBox(
              label: 'Secondary Color',
              color: Theme.of(context).colorScheme.secondary,
            ),

            // Zeigt die Surface Color
            _ColorBox(
              label: 'Surface Color',
              color: Theme.of(context).colorScheme.surface,
              textColor: Colors.black,
            ),

            const SizedBox(height: 30),

            // ==================== TEXT STYLES ====================
            Text(
              'Text-Styles',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 15),

            Card(
              // Card verwendet automatisch CardTheme aus dem Theme
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Verschiedene Text-Styles aus dem Theme
                    Text(
                      'Headline Large',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Headline Medium',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Headline Small',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Body Large - Normaler Text',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Body Medium - Kleinerer Text',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==================== BUTTONS ====================
            Text(
              'Buttons',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 15),

            // ElevatedButton verwendet automatisch ElevatedButtonTheme
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),

            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              label: const Text('Button with Icon'),
            ),

            const SizedBox(height: 10),

            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),

            const SizedBox(height: 10),

            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),

            const SizedBox(height: 30),

            // ==================== ICONS ====================
            Text(
              'Icons',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Icons verwenden automatisch IconTheme
                Icon(Icons.home, size: 40),
                Icon(Icons.favorite, size: 40),
                Icon(Icons.settings, size: 40),
                Icon(Icons.star, size: 40),
              ],
            ),

            const SizedBox(height: 30),

            // ==================== CARDS ====================
            Text(
              'Cards',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 15),

            // Card verwendet automatisch CardTheme
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 60,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Diese Card verwendet das Card-Theme',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ============================================
// HILFS-WIDGET: ColorBox
// ============================================
// Zeigt eine Farbbox mit Label an
class _ColorBox extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;

  const _ColorBox({
    required this.label,
    required this.color,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// ============================================
// WIE DU AUF THEME-WERTE ZUGREIFST
// ============================================
//
// Farben:
// - Theme.of(context).colorScheme.primary
// - Theme.of(context).colorScheme.secondary
// - Theme.of(context).colorScheme.surface
// - Theme.of(context).colorScheme.error
//
// Text-Styles:
// - Theme.of(context).textTheme.headlineLarge
// - Theme.of(context).textTheme.bodyLarge
// - Theme.of(context).textTheme.bodyMedium
//
// Hintergrundfarbe:
// - Theme.of(context).scaffoldBackgroundColor
//
// WICHTIG: Verwende immer Theme.of(context), nicht direkt Colors.blue!
// So bleibst du konsistent mit deinem Design-System
