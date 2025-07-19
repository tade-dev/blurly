import 'dart:ui';
import 'package:flutter/material.dart';

class BlurBackdrop extends StatelessWidget {
  final Widget child;
  final double blurSigma;
  final Color tint;
  final BorderRadius borderRadius;
  final bool showBorder;
  final Color? borderColor;
  final bool showShadow;
  final List<BoxShadow>? boxShadow;
  final BlendMode blendMode;

  const BlurBackdrop({
    super.key,
    required this.child,
    this.blurSigma = 20,
    this.tint = const Color.fromARGB(30, 255, 255, 255),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.showBorder = false,
    this.borderColor,
    this.showShadow = false,
    this.boxShadow,
    this.blendMode = BlendMode.srcOver,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: showShadow
            ? boxShadow ??
                [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
            : null,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Blur layer
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
              child: Container(
                decoration: BoxDecoration(
                  color: tint,
                  borderRadius: borderRadius,
                  border: showBorder
                      ? Border.all(
                          color: borderColor ?? Colors.white.withOpacity(0.15),
                          width: 1,
                        )
                      : null,
                ),
                foregroundDecoration: BoxDecoration(
                  color: Colors.transparent,
                  backgroundBlendMode: blendMode,
                ),
              ),
            ),
        
            // Foreground content
            child,
          ],
        ),
      ),
    );
  }
}