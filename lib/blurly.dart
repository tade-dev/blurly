// lib/blurly.dart
library;


/// A Flutter UI effects package for adding beautiful blur, glassmorphism, and
/// liquid glass visual effects to your widgets.
///
/// `Blurly` provides 3 customizable backdrop components:
/// - 🌀 `blur`: for minimal blur-only backdrops.
/// - ✨ `glass`: for modern glassmorphism-style blur with tint and shadow.
/// - 🌊 `liquidGlass`: for animated, interactive liquid glass effect.
///
/// Usage:
/// ```dart
/// import 'package:blurly/blurly.dart';
///
/// Widget build(BuildContext context) {
///   return Blurly.glass(
///     child: Text('Hello Blurly!'),
///   );
/// }
/// ```

import 'package:flutter/material.dart';
import 'widgets/blur_backdrop.dart';
import 'widgets/glass_backdrop.dart';
import 'widgets/liquid_glass_backdrop.dart';

export 'widgets/blur_backdrop.dart';
export 'widgets/glass_backdrop.dart';
export 'widgets/liquid_glass_backdrop.dart';

/// The main Blurly class for accessing different backdrop styles.
class Blurly {
  /// 🌀 Creates a minimal pure blur backdrop.
  ///
  /// Useful when you want a subtle blur with optional border or shadow.
  ///
  /// ```dart
  /// Blurly.blur(
  ///   child: Text('Soft blur'),
  /// )
  /// ```
  ///
  /// - [blurSigma]: Controls the strength of the blur.
  /// - [tint]: Optional background color overlay (usually semi-transparent).
  /// - [borderRadius]: Rounded corners.
  /// - [showBorder], [borderColor]: Add a border outline.
  /// - [showShadow], [boxShadow]: Add a drop shadow.
  /// - [blendMode]: Blend mode to apply on top of the tint.
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

  /// ✨ Creates a polished glassmorphism-style backdrop.
  ///
  /// Ideal for modern UI cards, modals, and elements requiring a frosted look.
  ///
  /// ```dart
  /// Blurly.glass(
  ///   child: Text('Glass style'),
  /// )
  /// ```
  ///
  /// - [blurSigma]: Controls blur strength.
  /// - [tint]: Background tint color.
  /// - [borderRadius]: Rounding for edges.
  /// - [showBorder], [borderColor]: Optional border.
  /// - [showShadow], [boxShadow]: Optional shadow.
  /// - [blendMode]: Optional blend mode.
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

  /// 🌊 Creates an animated, interactive liquid glass backdrop.
  ///
  /// Ideal for futuristic designs or fun visual effects.
  ///
  /// ```dart
  /// Blurly.liquidGlass(
  ///   child: Text('Liquid!'),
  /// )
  /// ```
  ///
  /// - [blurSigma]: Strength of blur.
  /// - [tint]: Tint applied on top.
  /// - [borderRadius]: Rounded edges.
  /// - [showBorder], [borderColor]: Optional border.
  /// - [interactive]: Whether the liquid effect reacts to touches.
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