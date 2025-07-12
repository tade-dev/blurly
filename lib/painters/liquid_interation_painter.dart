import 'package:flutter/material.dart';

class LiquidInteractionPainter extends CustomPainter {
  final Offset center;
  final double progress;
  final Color tint;

  LiquidInteractionPainter({
    required this.center,
    required this.progress,
    this.tint = Colors.white
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = progress * 180;
final paint = Paint()
  ..shader = RadialGradient(
    colors: [
      tint.withOpacity(0.3), // make it more visible
      Colors.transparent,
    ],
  ).createShader(Rect.fromCircle(center: center, radius: radius))
  ..blendMode = BlendMode.srcOver; // change blend mode for visibility

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant LiquidInteractionPainter oldDelegate) {
    return oldDelegate.center != center || oldDelegate.progress != progress;
  }
}