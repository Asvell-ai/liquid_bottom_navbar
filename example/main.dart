import 'package:flutter/material.dart';
import 'package:liquid_bottom_nav_bar/liquid_bottom_nav_bar.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DemoHome(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8B7455)),
      ),
    );
  }
}

class DemoHome extends StatefulWidget {
  const DemoHome({super.key});

  @override
  State<DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  int _index = 0;

  static const items = <LiquidNavItem>[
    LiquidNavItem(
      icon: Icons.home_rounded,
      label: 'Home',
    ),
    LiquidNavItem(
      icon: Icons.search_rounded,
      label: 'Search',
    ),
    LiquidNavItem(
      icon: Icons.favorite_rounded,
      label: 'Favorite',
    ),
    LiquidNavItem(
      icon: Icons.person_rounded,
      label: 'Profile',
    ),
  ];

  static const titles = ['Home', 'Search', 'Favorite', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            child: Text(
              '${titles[_index]} screen',
              key: ValueKey(_index),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: const Color(0xFF2B2B2B),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0,
                  ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: LiquidBottomNavBar(
        currentIndex: _index,
        items: items,
        onTap: (value) => setState(() => _index = value),
        onDrag: (value) => setState(() => _index = value),
        height: 56,
        iconSize: 20,
        showLabel: true,
        blurSigma: 14,
        margin: const EdgeInsets.fromLTRB(26, 0, 26, 28),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        animationDuration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        blobBaseWidthFactor: 0.94,
        blobExpandedWidthFactor: 1.34,
        blobBaseHeight: 42,
        blobExpandedHeight: 66,
        blobStretchMultiplier: 36,
        blobMaxStretch: 44,
        blobWobbleInfluenceOnWidth: 0.72,
        blobWobbleInfluenceOnHeight: 0.22,
        style: const LiquidNavStyle(
          backgroundColor: Color(0x00000000),
          containerColor: Color(0xDFFFFFFF),
          liquidColor: Color(0xFFEFE5D8),
          activeIconColor: Color(0xFF9D7C4E),
          inactiveIconColor: Color(0xFF777777),
          borderSide: BorderSide(color: Color(0x10000000), width: 0.8),
          borderRadius: BorderRadius.all(Radius.circular(31)),
          labelStyle: TextStyle(
            color: Color(0xFF777777),
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
          ),
          activeLabelStyle: TextStyle(
            color: Color(0xFF9D7C4E),
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 0,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x08000000),
              blurRadius: 24,
              offset: Offset(0, 4),
            ),
          ],
        ),
      ),
    );
  }
}
