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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const _NeomorphismButton(),
          AnimatedAlign(
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeInOut,
            alignment:
                _isOnRight ? Alignment.centerRight : Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => setState(() => _isOnRight = !_isOnRight),
              child: const _LiquidGlassButton(),
            ),
          ),
        ],
      ),
    );
  }
}

class _NeomorphismButton extends StatelessWidget {
  const _NeomorphismButton();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          BoxShadow(blurRadius: 50, color: Colors.white, offset: Offset(0, 8)),
        ],
      ),
    );
  }
}

class _LiquidGlassButton extends StatelessWidget {
  const _LiquidGlassButton();

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
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.01),
              width: 10,
            ),
          ),
        ),
      ),
    );
  }
}
