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
    Color? tint,
    BorderRadius? borderRadius,
    bool showBorder = false,
    Color? borderColor,
    bool showShadow = false,
    List<BoxShadow>? boxShadow,
    BlendMode blendMode = BlendMode.srcOver,
  }) {
    return BlurBackdrop(
      blurSigma: blurSigma,
      tint: tint ?? const Color.fromARGB(30, 255, 255, 255),
      borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(12)),
      showBorder: showBorder,
      borderColor: borderColor,
      showShadow: showShadow,
      boxShadow: boxShadow,
      blendMode: blendMode,
      child: child,
    );
  }
  
  /// ✨ Glassmorphism variant
  static Widget glass({
    required Widget child,
    double blurSigma = 20,
    Color tint = const Color.fromARGB(80, 255, 255, 255),
    BorderRadius? borderRadius,
    bool showBorder = false,
    Color? borderColor,
    bool showShadow = false,
    List<BoxShadow>? boxShadow,
    BlendMode blendMode = BlendMode.srcOver,
  }) {
    return GlassBackdrop(
      blurSigma: blurSigma,
      tint: tint,
      borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(12)),
      showBorder: showBorder,
      borderColor: borderColor,
      showShadow: showShadow,
      boxShadow: boxShadow,
      blendMode: blendMode,
      child: child,
    );
  }

  /// 🌊 Liquid glass variant
  static Widget liquidGlass({
    required Widget child,
    double blurSigma = 30,
    Color tint = const Color.fromARGB(50, 255, 255, 255),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(16)),
    bool showBorder = false,
    bool interactive = true,
    Color? borderColor,
  }) {
    return LiquidGlassBackdrop(
      blurSigma: blurSigma,
      tintColor: tint,
      borderRadius: borderRadius,
      showBorder: showBorder,
      borderColor: borderColor,
      interactive: interactive,
      child: child,
    );
  }
  
}