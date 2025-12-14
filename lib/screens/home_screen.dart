import 'package:flutter/material.dart';
import 'detail_screen.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              const Icon(
                Icons.home,
                size: 80,
                color: Colors.blue,
              ),

              const SizedBox(height: 30),

              // Titel
              const Text(
                'Willkommen!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // Beschreibung
              const Text(
                'Dies ist ein einfaches Flutter UI Tutorial',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 50),

              // Custom Button Widget
              CustomButton(
                text: 'Zum Detail Screen',
                icon: Icons.arrow_forward,
                onPressed: () {
                  // Navigation zum Detail Screen
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
            ],
          ),
        ),
      ),
    );
  }
}
