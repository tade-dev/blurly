import 'dart:ui';
import 'package:flutter/material.dart';
import '../painters/gloss_painter.dart';

class GlassBackdrop extends StatelessWidget {
  final Widget child;
  final double blurSigma;
  final Color color;
  final BorderRadius borderRadius;
  final bool showGloss;
  final bool showBorder;
  final Color? borderColor;
  final double glossOpacity;

  const GlassBackdrop({
    super.key,
    required this.child,
    this.blurSigma = 20,
    this.color = const Color.fromARGB(80, 255, 255, 255),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.showGloss = true,
    this.glossOpacity = 0.15,
    this.showBorder = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Blur + Tint
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: blurSigma,
                  sigmaY: blurSigma,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: borderRadius,
                    border: showBorder
                        ? Border.all(
                            color:
                                borderColor ?? Colors.white.withOpacity(0.2),
                            width: 1,
                          )
                        : null,
                  ),
                ),
              ),

              // Gloss
              if (showGloss)
                Positioned.fill(
                  child: CustomPaint(
                    painter: GlossPainter(opacity: glossOpacity),
                  ),
                ),

              // Foreground content
              child,
            ],
          ),
        ),
      ),
    );
  }
}