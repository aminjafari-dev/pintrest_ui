import 'package:flutter/material.dart';

class ColorPlate {
  const ColorPlate({
    required this.scaffoldBackground,
    required this.trackBackground,
    required this.borderGradientColors,
    required this.shadowColor,
    required this.labelColor,
    required this.glassColor,
    required this.iconColor,
  });

  final Color scaffoldBackground;
  final Color trackBackground;
  final List<Color> borderGradientColors;
  final Color shadowColor;
  final Color labelColor;
  final Color glassColor;
  final Color iconColor;
}

class ButtonColorPalette {
  static const ColorPlate lightMode = ColorPlate(
    scaffoldBackground: Color(0xe0E7E9ED),
    trackBackground: Color(0xFFF2F4F8),
    borderGradientColors: [Color(0xFFFFFFFF), Color(0xFFB0B7C5)],
    shadowColor: Color(0x99FFFFFF),
    labelColor: Color(0xFF2E3643),
    glassColor: Color(0x26FFFFFF),
    iconColor: Color(0xFF3A4352),
  );

  static const ColorPlate darkMode = ColorPlate(
    scaffoldBackground: Color(0xFF1F232B),
    trackBackground: Color(0xFF2A2F39),
    borderGradientColors: [Color(0xFF505868), Color(0xFF0D1016)],
    shadowColor: Color(0x66000000),
    labelColor: Color(0xFFFFFFFF),
    glassColor: Color(0x14FFFFFF),
    iconColor: Color(0xFFE0E6F2),
  );

  static ColorPlate fromMode({required bool isDarkMode}) {
    return isDarkMode ? darkMode : lightMode;
  }
}
