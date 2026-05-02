import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:pintrest_ui/color_plate.dart';

class PintresButton extends StatefulWidget {
  const PintresButton({super.key});

  @override
  State<PintresButton> createState() => _PintresButtonState();
}

class _PintresButtonState extends State<PintresButton> {
  bool _isOnRight = false;

  void _togglePosition() => setState(() => _isOnRight = !_isOnRight);

  @override
  Widget build(BuildContext context) {
    final colors = ButtonColorPalette.fromMode(isDarkMode: _isOnRight);
    return Scaffold(
      backgroundColor: colors.scaffoldBackground,
      body: Center(
        child: _Button(isOnRight: _isOnRight, onToggle: _togglePosition),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({required this.isOnRight, required this.onToggle});

  final bool isOnRight;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = isOnRight;
    final colors = ButtonColorPalette.fromMode(isDarkMode: isDarkMode);

    return SizedBox(
      width: 210,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _NeomorphismButton(
            onTap: onToggle,
            isOnRight: isOnRight,
            colors: colors,
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeInOut,
            alignment: isOnRight
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: GestureDetector(
              onTap: onToggle,
              child: _LiquidGlassButton(isOnRight: isOnRight, colors: colors),
            ),
          ),
        ],
      ),
    );
  }
}

class _NeomorphismButton extends StatelessWidget {
  const _NeomorphismButton({
    required this.onTap,
    required this.isOnRight,
    required this.colors,
  });

  final VoidCallback onTap;
  final bool isOnRight;
  final ColorPlate colors;

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
                color: colors.trackBackground,
                borderRadius: BorderRadius.circular(50),
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                    colors: colors.borderGradientColors,
                    begin: Alignment.center,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: colors.shadowColor,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: isOnRight
                    ? Alignment.centerLeft
                    : Alignment.centerRight,

                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  child: Text(
                    isOnRight ? 'DARK' : 'LIGHT',
                    key: ValueKey(isOnRight),
                    style: TextStyle(
                      color: colors.labelColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 2,
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
  const _LiquidGlassButton({required this.isOnRight, required this.colors});

  final bool isOnRight;
  final ColorPlate colors;

  @override
  Widget build(BuildContext context) {
    return LiquidGlass.withOwnLayer(
      settings: LiquidGlassSettings(
        thickness: 15,
        glassColor: colors.glassColor,
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
            color: colors.iconColor,
            size: 35,
          ),
        ),
      ),
    );
  }
}
