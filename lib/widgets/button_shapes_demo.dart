import 'package:flutter/material.dart';

/// BUTTON SHAPES DEMO
///
/// Zeigt verschiedene Button-Formen und wie man sie erstellt
class ButtonShapesDemo extends StatelessWidget {
  const ButtonShapesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Formen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ==================== 1. HARTE KANTEN (0 Radius) ====================
              Text(
                '1. Harte Kanten (eckig)',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),

              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.square),
                label: const Text('Komplett eckig'),
                style: ElevatedButton.styleFrom(
                  // HIER: BorderRadius.circular(0) = Harte Kanten!
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  // Oder noch einfacher:
                  // shape: const RoundedRectangleBorder(),
                ),
              ),

              const SizedBox(height: 40),

              // ==================== 2. LEICHT ABGERUNDET ====================
              Text(
                '2. Leicht abgerundet',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),

              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.rounded_corner),
                label: const Text('Kleine Rundung (4px)'),
                style: ElevatedButton.styleFrom(
                  // Kleine Rundung
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // ==================== 3. MITTEL ABGERUNDET ====================
              Text(
                '3. Mittel abgerundet',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),

              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.crop_square),
                label: const Text('Mittlere Rundung (12px)'),
                style: ElevatedButton.styleFrom(
                  // Das ist der Standard in unserem Theme
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // ==================== 4. PILL FORM (Kapsel) ====================
              Text(
                '4. Pill Form (Kapsel)',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),

              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.panorama_fish_eye),
                label: const Text('Komplett rund'),
                style: ElevatedButton.styleFrom(
                  // Sehr große Rundung = Kapsel-Form
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // ==================== 5. NUR BESTIMMTE ECKEN ABRUNDEN ====================
              Text(
                '5. Nur bestimmte Ecken',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),

              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.format_shapes),
                label: const Text('Nur oben abgerundet'),
                style: ElevatedButton.styleFrom(
                  // Nur oben links und oben rechts abrunden
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(0),  // Eckig
                      bottomRight: Radius.circular(0), // Eckig
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // ==================== 6. MIT RAHMEN ====================
              Text(
                '6. Mit Rahmen (Border)',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),

              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.border_style),
                label: const Text('Eckig mit Rahmen'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // Eckig
                    side: const BorderSide(
                      color: Colors.red,  // Rote Rahmenfarbe
                      width: 2,           // 2px Rahmenstärke
                    ),
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
// WIE DU HARTE KANTEN BEKOMMST
// ============================================
//
// VARIANTE 1 - Im einzelnen Button:
//   ElevatedButton(
//     style: ElevatedButton.styleFrom(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(0),  // ← 0 = eckig!
//       ),
//     ),
//     ...
//   )
//
// VARIANTE 2 - Im Theme für ALLE Buttons:
//   In app_theme.dart bei elevatedButtonTheme:
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(0),  // ← Alle Buttons eckig
//   ),
//
// VARIANTE 3 - Im CustomButton Widget:
//   In custom_button.dart Zeile 68 ändern:
//   borderRadius: BorderRadius.circular(0),  // Statt 12
