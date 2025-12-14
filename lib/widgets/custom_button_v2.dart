import 'package:flutter/material.dart';

/// CUSTOM BUTTON V2 - Mit konfigurierbarer Form
///
/// Dies ist eine erweiterte Version des CustomButtons,
/// bei der du die Form (rund/eckig) selbst bestimmen kannst!
class CustomButtonV2 extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  // NEU: Parameter für die Ecken-Rundung!
  // Wenn nicht angegeben, wird 12 als Standard verwendet
  final double borderRadius;

  // NEU: Optional - Button-Farbe überschreibbar
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomButtonV2({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.borderRadius = 12,        // Standard: 12px abgerundet
    this.backgroundColor,          // Optional
    this.foregroundColor,          // Optional
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        // Verwendet die übergebene Farbe oder Standard-Blau
        backgroundColor: backgroundColor ?? Colors.blue,
        foregroundColor: foregroundColor ?? Colors.white,

        // HIER IST DER UNTERSCHIED:
        // Verwendet den borderRadius-Parameter!
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

// ============================================
// WIE DU ES BENUTZT
// ============================================
//
// 1. Eckiger Button (harte Kanten):
//    CustomButtonV2(
//      text: 'Eckig',
//      icon: Icons.square,
//      borderRadius: 0,  // ← Eckig!
//      onPressed: () {},
//    )
//
// 2. Leicht abgerundeter Button:
//    CustomButtonV2(
//      text: 'Leicht rund',
//      icon: Icons.check,
//      borderRadius: 4,  // ← Kleine Rundung
//      onPressed: () {},
//    )
//
// 3. Standard Button (wie vorher):
//    CustomButtonV2(
//      text: 'Normal',
//      icon: Icons.home,
//      // borderRadius wird nicht angegeben → Standard 12
//      onPressed: () {},
//    )
//
// 4. Pill Button (Kapsel):
//    CustomButtonV2(
//      text: 'Kapsel',
//      icon: Icons.star,
//      borderRadius: 50,  // ← Sehr rund
//      onPressed: () {},
//    )
//
// 5. Mit eigener Farbe UND Form:
//    CustomButtonV2(
//      text: 'Custom',
//      icon: Icons.color_lens,
//      borderRadius: 0,
//      backgroundColor: Colors.red,
//      foregroundColor: Colors.white,
//      onPressed: () {},
//    )
