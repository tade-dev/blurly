// lib/widgets/liquid_glass_backdrop.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import '../painters/gloss_painter.dart';

class LiquidGlassBackdrop extends StatelessWidget {
  final Widget child;
  final double blurSigma;
  final Color tintColor;
  final BorderRadius borderRadius;
  final double glossOpacity;
  final bool showGloss;
  final bool showBorder;
  final Color? borderColor;

  const LiquidGlassBackdrop({
    super.key,
    required this.child,
    this.blurSigma = 30,
    this.tintColor = const Color.fromARGB(50, 255, 255, 255),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.glossOpacity = 0.15,
    this.showGloss = true,
    this.showBorder = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          // Blur layer
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: Container(
              decoration: BoxDecoration(
                color: tintColor,
                borderRadius: borderRadius,
                border: showBorder
                    ? Border.all(
                        color: borderColor ?? Colors.white.withOpacity(0.2),
                        width: 1.0,
                      )
                    : null,
              ),
            ),
          ),

          // Optional gloss layer
          if (showGloss)
            CustomPaint(
              painter: GlossPainter(opacity: glossOpacity),
              size: Size.infinite,
            ),

          // Main content
          child,
        ],
      ),
    );
  }
}