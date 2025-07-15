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
    BorderRadius? borderRadius,
    bool showBorder = false,
    Color? borderColor,
    bool showShadow = false,
    List<BoxShadow>? boxShadow,
    bool showNoise = false,
    ImageProvider<Object>? noiseImage,
    BlendMode blendMode = BlendMode.srcOver,
  }) {
    return BlurBackdrop(
      blurSigma: blurSigma,
      backgroundColor: backgroundColor ?? const Color.fromARGB(30, 255, 255, 255),
      borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(12)),
      showBorder: showBorder,
      borderColor: borderColor,
      showShadow: showShadow,
      boxShadow: boxShadow,
      showNoise: showNoise,
      noiseImage: noiseImage,
      blendMode: blendMode,
      child: child,
    );
  }
  
  /// ✨ Glassmorphism variant
  static Widget glass({
    required Widget child,
    double blurSigma = 20,
    Color color = const Color.fromARGB(80, 255, 255, 255),
    BorderRadius? borderRadius,
    bool showGloss = true,
    double glossOpacity = 0.15,
    bool showBorder = false,
    Color? borderColor,
    bool showShadow = false,
    List<BoxShadow>? boxShadow,
    bool showNoise = false,
    ImageProvider<Object>? noiseImage,
    BlendMode blendMode = BlendMode.srcOver,
  }) {
    return GlassBackdrop(
      blurSigma: blurSigma,
      color: color,
      borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(12)),
      showGloss: showGloss,
      glossOpacity: glossOpacity,
      showBorder: showBorder,
      borderColor: borderColor,
      showShadow: showShadow,
      boxShadow: boxShadow,
      showNoise: showNoise,
      noiseImage: noiseImage,
      blendMode: blendMode,
      child: child,
    );
  }

  /// 🌊 Liquid glass variant
  static Widget liquidGlass({
    required Widget child,
    double blurSigma = 30,
    Color tintColor = const Color.fromARGB(50, 255, 255, 255),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(16)),
    bool showBorder = false,
    bool interactive = true,
    Color? borderColor,
  }) {
    return LiquidGlassBackdrop(
      blurSigma: blurSigma,
      tintColor: tintColor,
      borderRadius: borderRadius,
      showBorder: showBorder,
      borderColor: borderColor,
      interactive: interactive,
      child: child,
    );
  }
  
}