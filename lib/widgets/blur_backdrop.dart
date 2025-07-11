// lib/widgets/blur_backdrop.dart
import 'dart:ui';
import 'package:flutter/material.dart';

class BlurBackdrop extends StatelessWidget {
  final Widget child;
  final double blurSigma;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const BlurBackdrop({
    super.key,
    required this.child,
    this.blurSigma = 20,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white.withOpacity(0.1),
            borderRadius: borderRadius,
          ),
          child: child,
        ),
      ),
    );
  }
}