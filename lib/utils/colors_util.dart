import 'dart:ui';

import 'package:flutter/material.dart';

class ColorsUtil {
  static final lightRed = getColorByHex('#CA5252');
  static final lightGreen = getColorByHex('#5AC25E');
  static final darkRed = getColorByHex('#4A2020');
  static final darkGreen = getColorByHex('#37353F');
  static final primaryGray = getColorByHex('#DBDBDB');
  static final white = getColorByHex('#FFFFFF');
  static final success = getColorByHex('#5ABCC2');

  static Color getColorByHex(String hex) {
    return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
  }
}
