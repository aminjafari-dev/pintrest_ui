import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class PintresButton extends StatelessWidget {
  const PintresButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8F8F97),
      body: Center(child: _Button()),
    );
  }
}

class _Button extends StatefulWidget {
  const _Button();

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  bool _isOnRight = false;
  void _togglePosition() => setState(() => _isOnRight = !_isOnRight);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _NeomorphismButton(onTap: _togglePosition, isOnRight: _isOnRight),
          AnimatedAlign(
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeInOut,
            alignment: _isOnRight
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: GestureDetector(
              onTap: _togglePosition,
              child: _LiquidGlassButton(isOnRight: _isOnRight),
            ),
          ),
        ],
      ),
    );
  }
}

class _NeomorphismButton extends StatelessWidget {
  const _NeomorphismButton({required this.onTap, required this.isOnRight});

  final VoidCallback onTap;
  final bool isOnRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: SizedBox(
        width: 200,
        height: 70,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 70,
              decoration: BoxDecoration(
                color: Color(0xFF919199),
                borderRadius: BorderRadius.circular(50),
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.black],
                    begin: Alignment.center,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: Colors.white,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  child: Text(
                    isOnRight ? 'DARK' : 'LIGHT',
                    key: ValueKey(isOnRight),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LiquidGlassButton extends StatelessWidget {
  const _LiquidGlassButton({required this.isOnRight});

  final bool isOnRight;

  @override
  Widget build(BuildContext context) {
    return LiquidGlass.withOwnLayer(
      settings: LiquidGlassSettings(
        thickness: 15,
        glassColor: Colors.white.withValues(alpha: 0.01),
        lightIntensity: 5,
        blur: 0,
      ),
      shape: LiquidRoundedRectangle(borderRadius: 50),
      child: SizedBox(
        width: 78,
        height: 120,
        child: Center(
          child: Icon(
            isOnRight ? Icons.sunny : Icons.nights_stay_rounded,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}
