// lib/blurly.dart
library blurly;

import 'package:flutter/material.dart';
import 'widgets/blur_backdrop.dart';
import 'widgets/glass_backdrop.dart';
import 'widgets/liquid_glass_backdrop.dart';

export 'widgets/blur_backdrop.dart';
export 'widgets/glass_backdrop.dart';
export 'widgets/liquid_glass_backdrop.dart';

class Blurly {
  /// 🌀 Pure blur variant
  static Widget blur({
    required Widget child,
    double blurSigma = 20,
    Color? backgroundColor,
    BorderRadius? borderRadius, required Color tintColor,
  }) {
    return BlurBackdrop(
      blurSigma: blurSigma,
      backgroundColor: tintColor,
      borderRadius: borderRadius,
      child: child,
    );
  }

  /// ✨ Glassmorphism variant
  static Widget glass({
    required Widget child,
    double blurSigma = 20,
    Color color = const Color.fromARGB(80, 255, 255, 255),
    BorderRadius? borderRadius, required Color tintColor, required double glossOpacity,
  }) {
    return GlassBackdrop(
      blurSigma: blurSigma,
      color: tintColor,
      borderRadius: borderRadius,
      child: child,
    );
  }

  /// 🌊 Liquid glass variant
  static Widget liquidGlass({
    required Widget child,
    double blurSigma = 30,
    Color tintColor = const Color.fromARGB(50, 255, 255, 255),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(16)),
    double glossOpacity = 0.15,
    bool showGloss = true,
    bool showBorder = false,
    bool interactive = true,
    Color? borderColor,
  }) {
    return LiquidGlassBackdrop(
      blurSigma: blurSigma,
      tintColor: tintColor,
      borderRadius: borderRadius,
      glossOpacity: glossOpacity,
      showGloss: showGloss,
      showBorder: showBorder,
      borderColor: borderColor,
      interactive: interactive,
      child: child,
    );
  }
}