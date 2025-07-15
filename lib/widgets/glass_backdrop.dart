import 'dart:ui';
import 'package:flutter/material.dart';

class GlassBackdrop extends StatelessWidget {
  final Widget child;
  final double blurSigma;
  final Color color;
  final BorderRadius borderRadius;
  final bool showGloss;
  final double glossOpacity;
  final bool showBorder;
  final Color? borderColor;
  final bool showShadow;
  final List<BoxShadow>? boxShadow;
  final bool showNoise;
  final ImageProvider<Object>? noiseImage;
  final BlendMode blendMode;

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
    this.showShadow = false,
    this.boxShadow,
    this.showNoise = false,
    this.noiseImage,
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
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ]
            : null,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: IntrinsicWidth(
          child: IntrinsicHeight(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Blur + Tint with blend mode
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
        ),
      ),
    );
  }
}