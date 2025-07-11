// lib/widgets/glass_backdrop.dart
import 'package:flutter/material.dart';
import 'blur_backdrop.dart';

class GlassBackdrop extends StatelessWidget {
  final Widget child;
  final double blurSigma;
  final Color color;
  final BorderRadius? borderRadius;

  const GlassBackdrop({
    super.key,
    required this.child,
    this.blurSigma = 20,
    this.color = const Color.fromARGB(80, 255, 255, 255),
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return BlurBackdrop(
      blurSigma: blurSigma,
      backgroundColor: color,
      borderRadius: borderRadius,
      child: child,
    );
  }
}