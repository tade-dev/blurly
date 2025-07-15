import 'package:blurly/blurly.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Blurly Widget Tests', () {
    testWidgets('Blurly.blur renders child and blur layer', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Blurly.blur(
              blurSigma: 10,
              child: const Text('Blur Test'),
            ),
          ),
        ),
      );

      expect(find.text('Blur Test'), findsOneWidget);
    });

    testWidgets('Blurly.glass renders child with default tint', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Blurly.glass(
              child: const Text('Glass Test'),
            ),
          ),
        ),
      );

      expect(find.text('Glass Test'), findsOneWidget);
    });

    testWidgets('Blurly.liquidGlass renders with gloss by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Blurly.liquidGlass(
              child: const Text('Liquid Test'),
            ),
          ),
        ),
      );

      expect(find.text('Liquid Test'), findsOneWidget);
    });

    testWidgets('Blurly.liquidGlass hides gloss when showGloss = false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Blurly.liquidGlass(
              child: const Text('No Gloss'),
            ),
          ),
        ),
      );

      expect(find.text('No Gloss'), findsOneWidget);
    });
  });
}