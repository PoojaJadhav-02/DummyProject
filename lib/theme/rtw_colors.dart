import 'package:flutter/material.dart';

/// Colors measured from RTW frame `800:892`.
///
/// Alpha bytes match the Figma paints: `0x0D` is 5.1%, `0x26` is 14.9%,
/// and `0x29` is 16.1%.
abstract final class RtwColors {
  static const background = Color(0xFF060C0A);
  static const ivory = Color(0xFFF2F6F2);
  static const sage = Color(0xFFA8B9B5);
  static const green = Color(0xFF2DCC70);
  static const mint = Color(0xFFA3F4B0);
  static const lime = Color(0xFFA0D113);
  static const white = Color(0xFFFFFFFF);

  static const white5 = Color(0x0DFFFFFF);
  static const white15 = Color(0x26FFFFFF);
  static const white16 = Color(0x29FFFFFF);
  static const green5 = Color(0x0D2DCC70);
  static const green16 = Color(0x292DCC70);

  /// Gallery color behind the phone frame. It is not part of the Figma screen.
  static const stage = Color(0xFFE6E2DC);
}