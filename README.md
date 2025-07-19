# 🌀 Blurly

A lightweight Flutter package for creating beautiful **blurred**, **glassmorphic**, and **liquid glass** UI backdrops with ease.  

Perfect for frosted cards, modal backgrounds, and stunning UI overlays.

---

## ✨ Features

- 🔹 Pure blur effect with tint and border options
- ✨ Glassmorphism-style blur with optional gloss and shadow
- 🌊 Interactive liquid glass animations
- 🎨 Highly customizable: radius, shadows, borders, and blend modes

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  blurly: ^0.0.1
```

## 🚀 Usage

### 1. 🌀 Simple Blur
```dart
import 'package:blurly/blurly.dart';

Blurly.blur(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Just blurred!'),
  ),
)
```

### 2. ✨ Glassmorphism Style
```dart
import 'package:blurly/blurly.dart';

Blurly.glass(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Smooth glass effect!'),
  ),
  showShadow: true,
  showBorder: true,
)
```

### 3. 🌊 Liquid Glass
```dart
import 'package:blurly/blurly.dart';

Blurly.liquidGlass(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Liquid motion!'),
  ),
  interactive: true,
)
```

---

## 💡 Demo

---

## 📁 Example

View a full working example in `example/lib/main.dart`:

Run it locally:
```bash
 flutter run example/lib/main.dart
```