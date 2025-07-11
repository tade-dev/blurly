// lib/painters/gloss_painter.dart
import 'package:flutter/material.dart';

class GlossPainter extends CustomPainter {
  final double opacity;

  GlossPainter({this.opacity = 0.15});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 0.4);
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white.withOpacity(opacity),
        Colors.white.withOpacity(0.0),
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..blendMode = BlendMode.softLight;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}