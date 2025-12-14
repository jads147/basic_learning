# 🎨 Theme Switcher - Windows 98 vs Modern

Ein Flutter Tutorial-Projekt mit **Theme-Wechsel-Funktion**!

## 🚀 Wie starte ich die Theme Switcher App?

### Option 1: Temporär starten (ohne main.dart zu ändern)

```bash
flutter run -t lib/main_theme_switcher.dart
```

### Option 2: Als Standard-App setzen

Benenne die Dateien um:
```bash
# Backup der aktuellen main.dart
mv lib/main.dart lib/main_old.dart

# Theme Switcher als neue main.dart
mv lib/main_theme_switcher.dart lib/main.dart

# Jetzt normal starten
flutter run
```

### Option 3: In main.dart importieren

Ändere `lib/main.dart` zu:
```dart
import 'package:flutter/material.dart';
import 'main_theme_switcher.dart';

void main() {
  runApp(const ThemeSwitcherApp());
}
```

## 🎯 Was macht die App?

- **Button zum Umschalten** zwischen zwei Themes
- **Modernes Theme**: Abgerundete Ecken, Material Design, moderne Farben
- **Windows 98 Theme**: Harte Kanten, 3D-Buttons, klassisches Grau

## 📁 Neue Dateien

```
lib/
├── main_theme_switcher.dart        # App mit Theme-Switcher
├── screens/
│   └── theme_switcher_home.dart    # Home Screen mit Toggle-Button
└── theme/
    └── windows98_theme.dart        # Windows 98 Retro Theme
```

## 🎨 Features

### Windows 98 Theme
- ✅ **Harte Kanten** (borderRadius: 0)
- ✅ **3D Button Effekte** (mit Border-Schatten)
- ✅ **Klassisches Grau** (#C0C0C0)
- ✅ **Desktop Türkis** (#008080)
- ✅ **Win98Button Widget** mit echter 3D-Optik
- ✅ **Win98Panel Widget** für vertiefte Bereiche
- ✅ **Monospace Font** (Courier-ähnlich)

### Modernes Theme
- ✅ **Abgerundete Ecken**
- ✅ **Material Design 3**
- ✅ **Moderne Farben** (Lila Primary)
- ✅ **Schatten-Effekte**
- ✅ **CustomButton Widget**

## 🧠 Was du lernst

1. **State Management**
   - StatefulWidget vs StatelessWidget
   - setState() für UI-Updates
   - State in parent, Callbacks für Kommunikation

2. **Theme System**
   - Mehrere Themes definieren
   - Theme dynamisch wechseln
   - Theme.of(context) verwenden

3. **Conditional Rendering**
   - if/else in Widget-Tree
   - Verschiedene Widgets basierend auf State

4. **Custom Widgets**
   - Win98Button mit GestureDetector
   - 3D-Effekte mit Border
   - Wiederverwendbare UI-Komponenten

## 🎮 Ausprobieren

1. Starte die App
2. Klicke auf "Aktiviere Windows 98 Modus"
3. Erlebe das Retro-Design! 🖥️
4. Klicke auf "Zurück zum modernen Design"
5. Wechsle beliebig oft zwischen den Themes

## 🔧 Anpassungen

### Neue Farbe im Windows 98 Theme:
`lib/theme/windows98_theme.dart`:
```dart
static const Color win98Gray = Color(0xFFC0C0C0); // Ändere hier
```

### Neues Theme hinzufügen:
1. Erstelle `lib/theme/dein_theme.dart`
2. Füge in `main_theme_switcher.dart` hinzu:
```dart
bool isCustomMode = false;

theme: isCustomMode ? DeinTheme.theme : ...
```

## 🎨 Weitere Theme-Ideen

- **MacOS Classic** (Platin, Aqua)
- **Neon/Cyberpunk** (Pink, Cyan, Schwarz)
- **Gameboy** (Grün-Monochrom)
- **Solarized** (Pastell-Farben)
- **High Contrast** (Barrierefreiheit)

Viel Spaß! 🚀
