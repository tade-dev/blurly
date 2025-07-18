import 'package:flutter/material.dart';
import 'package:blurly/blurly.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(const BlurlyDemoApp());
}

class BlurlyDemoApp extends StatelessWidget {
  const BlurlyDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blurly Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const BlurlyHomePage(),
    );
  }
}

class BlurlyHomePage extends StatefulWidget {
  const BlurlyHomePage({super.key});

  @override
  State<BlurlyHomePage> createState() => _BlurlyHomePageState();
}

class _BlurlyHomePageState extends State<BlurlyHomePage> {
  int _currentIndex = 0;
  bool _enableRipples = true;
  double _blurSigma = 30;
  Color _tintColor = const Color.fromARGB(50, 255, 255, 255);

  final tabs = ['Blur', 'Glass', 'Liquid'];

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Blurly Showcase'),
      centerTitle: true,
    ),
    body: Stack(
      children: [
        // Background image for blur effect
        Positioned.fill(
          child: Image.network(
            'https://images.unsplash.com/photo-1605460375648-278bcbd579a6?auto=format&fit=crop&w=1000&q=80',
            fit: BoxFit.cover,
          ),
        ),

        // Dark overlay
        Positioned.fill(
          child: Container(color: Colors.black.withOpacity(0.4)),
        ),

        // Main content with blur widget and controls side by side
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Responsive: if narrow screen, stack vertically
                final isNarrow = constraints.maxWidth < 600;
                return isNarrow
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildBlurCard(),
                          const SizedBox(height: 20),
                          _buildControls(),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildBlurCard(),
                          const SizedBox(width: 24),
                          SizedBox(
                            width: 250,
                            child: _buildControls(),
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ],
    ),
    bottomNavigationBar: NavigationBar(
      selectedIndex: _currentIndex,
      destinations: tabs
          .map((label) => NavigationDestination(
                icon: const Icon(Icons.blur_on),
                label: label,
              ))
          .toList(),
      onDestinationSelected: (index) => setState(() => _currentIndex = index),
    ),
  );
}

  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick Tint Color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: _tintColor,
            onColorChanged: (color) {
              setState(() => _tintColor = color);
            },
            enableAlpha: true,
            displayThumbColor: true,
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Done'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Column(
      children: [
        // Tint Color
        ListTile(
          title: const Text("Tint Color"),
          trailing: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: _tintColor,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onTap: _showColorPicker,
        ),
        // Blur Sigma
        ListTile(
          title: const Text('Blur Sigma'),
          subtitle: Slider(
            value: _blurSigma,
            min: 0,
            max: 100,
            divisions: 50,
            label: _blurSigma.toStringAsFixed(1),
            onChanged: (val) => setState(() => _blurSigma = val),
          ),
        ),
        if (_currentIndex == 2)
          SwitchListTile(
            title: const Text("Interactive"),
            value: _enableRipples,
            onChanged: (val) => setState(() => _enableRipples = val),
          ),
      ],
    );
  }

  Widget _buildBlurCard() {
    final card = Container(
      height: 180,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tabs[_currentIndex],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'This is a demo of Blurly’s backdrop effects. Toggle modes below and enjoy the UI magic!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );

  switch (_currentIndex) {
    case 0:
      return Blurly.blur(
        blurSigma: _blurSigma,
        tint: _tintColor,
        child: card,
      );
    case 1:
      return Blurly.glass(
        blurSigma: _blurSigma,
        tint: _tintColor,
        child: card,
      );
    case 2:
      return Blurly.liquidGlass(
        blurSigma: _blurSigma,
        tint: _tintColor,
        interactive: _enableRipples,
        child: card,
      );
    default:
      return card;
  }
  }
}