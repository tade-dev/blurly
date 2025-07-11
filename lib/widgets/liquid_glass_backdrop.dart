import 'dart:developer';
import 'dart:ui';
import 'package:blurly/painters/liquid_interation_painter.dart';
import 'package:flutter/material.dart';
import '../painters/gloss_painter.dart';

class LiquidGlassBackdrop extends StatefulWidget {
  final Widget child;
  final double blurSigma;
  final Color tintColor;
  final BorderRadius borderRadius;
  final double glossOpacity;
  final bool showGloss;
  final bool showBorder;
  final Color? borderColor;

  /// Whether to show interactive ripples on tap/drag
  final bool interactive;

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
    this.interactive = true,
  });

  @override
  State<LiquidGlassBackdrop> createState() => _LiquidGlassBackdropState();
}

class _LiquidGlassBackdropState extends State<LiquidGlassBackdrop>
    with TickerProviderStateMixin {
  final List<_Ripple> _ripples = [];

  void _triggerRipple(Offset offset) {
    if (!widget.interactive) return;

    log(offset.toString());

    final controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    final ripple = _Ripple(center: offset, controller: controller);
    _ripples.add(ripple);

    // Remove after animation completes
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
        _ripples.remove(ripple);
        setState(() {});
      }
    });

    // Limit ripple count
    if (_ripples.length > 5) {
      _ripples.removeAt(0).controller.dispose();
    }

    setState(() {});
  }

  @override
  void dispose() {
    for (final r in _ripples) {
      r.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: GestureDetector(
        onTapDown: (details) => _triggerRipple(details.localPosition),
        onPanUpdate: (details) => _triggerRipple(details.localPosition),
        child: Stack(
          children: [
            // Blur
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: widget.blurSigma,
                sigmaY: widget.blurSigma,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.tintColor,
                  borderRadius: widget.borderRadius,
                  border: widget.showBorder
                      ? Border.all(
                          color: widget.borderColor ??
                              Colors.white.withOpacity(0.2),
                          width: 1.0,
                        )
                      : null,
                ),
              ),
            ),

            // Gloss
            if (widget.showGloss)
              CustomPaint(
                painter: GlossPainter(opacity: widget.glossOpacity),
                size: Size.infinite,
              ),

            // Liquid Ripples
            if(widget.interactive)
            ..._ripples.map((r) => AnimatedBuilder(
                  animation: r.controller,
                  builder: (_, __) => CustomPaint(
                    painter: LiquidInteractionPainter(
                      center: r.center,
                      progress: r.controller.value,
                    ),
                    size: Size.infinite,
                  ),
                )),

            // Content
            widget.child,
          ],
        ),
      ),
    );
  }
}

class _Ripple {
  final Offset center;
  final AnimationController controller;

  _Ripple({required this.center, required this.controller});
}