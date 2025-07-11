import 'package:flutter/material.dart';
import 'package:blurly/blurly.dart';

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
  bool _showGloss = true;
  bool _enableRipples = true;

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

          // Centered blur card
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: _buildBlurCard(),
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

  Widget _buildBlurCard() {
    final card = Container(
      width: MediaQuery.sizeOf(context).width * 0.7,
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
          if (_currentIndex == 2) ...[
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    const Text('Gloss'),
                    Switch.adaptive(
                      value: _showGloss,
                      onChanged: (val) => setState(() => _showGloss = val),
                    ),
                  ],
                ),
                SizedBox(width: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    const Text('Interactive'),
                    Switch.adaptive(
                      value: _enableRipples,
                      onChanged: (val) => setState(() => _enableRipples = val),
                    ),
                  ],
                ),
              ],
            ),
          ]
        ],
      ),
    );

    switch (_currentIndex) {
      case 0:
        return Blurly.blur(child: card);
      case 1:
        return Blurly.glass(child: card);
      case 2:
        return Blurly.liquidGlass(
          child: Center(child: card), 
          showGloss: _showGloss,
          interactive: _enableRipples
        );
      default:
        return card;
    }
  }
}