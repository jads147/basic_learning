import 'package:flutter/material.dart';

/// WINDOWS 98 RETRO THEME
///
/// Ein nostalgisches Theme im Stil von Windows 98!
/// - Harte Kanten überall
/// - Grauer Desktop-Look
/// - 3D-Button Effekte
/// - Klassische Farben
class Windows98Theme {
  // ============================================
  // WINDOWS 98 FARBEN
  // ============================================
  static const Color win98Gray = Color(0xFFC0C0C0);      // Klassisches Grau
  static const Color win98DarkGray = Color(0xFF808080);  // Dunkles Grau
  static const Color win98Blue = Color(0xFF000080);      // Navy Blue (Titelleiste)
  static const Color win98LightBlue = Color(0xFF0080FF); // Hell Blau (aktiv)
  static const Color win98Black = Color(0xFF000000);     // Schwarz
  static const Color win98White = Color(0xFFFFFFFF);     // Weiß
  static const Color win98Desktop = Color(0xFF008080);   // Türkis Desktop

  // 3D Effekt Farben (für Buttons)
  static const Color win98Highlight = Color(0xFFDFDFDF); // Helle Kante
  static const Color win98Shadow = Color(0xFF404040);    // Dunkle Kante

  // ============================================
  // WINDOWS 98 THEME
  // ============================================
  static ThemeData theme = ThemeData(
    useMaterial3: false, // Material 2 für mehr Kontrolle!

    // Farbschema
    colorScheme: const ColorScheme.light(
      primary: win98Blue,
      secondary: win98LightBlue,
      surface: win98Gray,
      error: Colors.red,
      onPrimary: win98White,
      onSecondary: win98Black,
      onSurface: win98Black,
    ),

    // Desktop Hintergrund
    scaffoldBackgroundColor: win98Desktop,

    // ==================== APP BAR (Titelleiste) ====================
    appBarTheme: const AppBarTheme(
      backgroundColor: win98Blue,
      foregroundColor: win98White,
      elevation: 0,
      centerTitle: false, // Links ausgerichtet wie Windows 98
      titleTextStyle: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: win98White,
        fontFamily: 'Courier', // Monospace Font
      ),
    ),

    // ==================== BUTTONS ====================
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: win98Gray,
        foregroundColor: win98Black,

        // HARTE KANTEN!
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Komplett eckig!
        ),

        elevation: 0, // Kein Material-Schatten

        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        textStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.normal,
          fontFamily: 'Courier',
        ),

        // 3D Rahmen-Effekt (wird unten mit Container gemacht)
      ),
    ),

    // ==================== CARDS ====================
    cardTheme: const CardThemeData(
      color: win98Gray,
      elevation: 0,

      // HARTE KANTEN!
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(color: win98DarkGray, width: 1),
      ),

      margin: EdgeInsets.all(4),
    ),

    // ==================== TEXT ====================
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: win98Black,
        fontFamily: 'Courier',
      ),
      headlineMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: win98Black,
        fontFamily: 'Courier',
      ),
      bodyLarge: TextStyle(
        fontSize: 11,
        color: win98Black,
        fontFamily: 'Courier',
      ),
      bodyMedium: TextStyle(
        fontSize: 10,
        color: win98Black,
        fontFamily: 'Courier',
      ),
    ),

    // ==================== ICONS ====================
    iconTheme: const IconThemeData(
      color: win98Black,
      size: 16, // Kleinere Icons wie in Win98
    ),

    // ==================== INPUT FIELDS ====================
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: win98White,

      // HARTE KANTEN!
      border: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: win98DarkGray, width: 1),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: win98Black, width: 2),
      ),
    ),
  );
}

// ============================================
// WINDOWS 98 BUTTON WIDGET
// ============================================
// Ein spezieller Button mit 3D-Effekt wie in Windows 98
class Win98Button extends StatefulWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final double? width;

  const Win98Button({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.width,
  });

  @override
  State<Win98Button> createState() => _Win98ButtonState();
}

class _Win98ButtonState extends State<Win98Button> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => isPressed = false),

      child: Container(
        width: widget.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        // 3D EFFEKT mit mehreren Rahmen!
        decoration: BoxDecoration(
          color: Windows98Theme.win98Gray,

          // Äußerer Rahmen (3D Effekt)
          border: Border(
            // Wenn gedrückt: Schatten oben/links, Highlight unten/rechts
            // Wenn nicht gedrückt: Highlight oben/links, Schatten unten/rechts
            top: BorderSide(
              color: isPressed
                ? Windows98Theme.win98Shadow
                : Windows98Theme.win98Highlight,
              width: 2,
            ),
            left: BorderSide(
              color: isPressed
                ? Windows98Theme.win98Shadow
                : Windows98Theme.win98Highlight,
              width: 2,
            ),
            bottom: BorderSide(
              color: isPressed
                ? Windows98Theme.win98Highlight
                : Windows98Theme.win98Shadow,
              width: 2,
            ),
            right: BorderSide(
              color: isPressed
                ? Windows98Theme.win98Highlight
                : Windows98Theme.win98Shadow,
              width: 2,
            ),
          ),
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null) ...[
              Icon(
                widget.icon,
                size: 16,
                color: Windows98Theme.win98Black,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 11,
                color: Windows98Theme.win98Black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// WINDOWS 98 PANEL WIDGET
// ============================================
// Ein Container mit 3D vertieftem Effekt (wie Input-Felder)
class Win98Panel extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const Win98Panel({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Windows98Theme.win98Gray,
        // Vertiefter 3D Effekt (umgekehrt zum Button)
        border: const Border(
          top: BorderSide(color: Windows98Theme.win98Shadow, width: 2),
          left: BorderSide(color: Windows98Theme.win98Shadow, width: 2),
          bottom: BorderSide(color: Windows98Theme.win98Highlight, width: 2),
          right: BorderSide(color: Windows98Theme.win98Highlight, width: 2),
        ),
      ),
      child: child,
    );
  }
}
