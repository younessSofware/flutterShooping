import 'package:flutter/material.dart';

class AppColors {
  static Color get white => Colors.white;

  static Color get whiteGrey => Colors.grey[100]!;

  static Color get lightGrey => Colors.grey[300]!;

  static Color get grey => Colors.grey;

  static Color get darkGrey => Colors.grey[700]!;

  static Color get black => Colors.black;

  static Color get bodyColor => Color.fromRGBO(237, 242, 247, 1);

  // CAUTION: use this function only when you are sure that there is a user in the local storage
  static Color get primary {
    return AppColors._primaryBlue;
  }

  static Color get _primaryBlue => const Color.fromRGBO(0, 169, 192, 1);

  static Color get _primaryGreen => const Color.fromRGBO(38, 195, 174, 1);

  static Color get primaryDark => const Color.fromRGBO(56, 56, 56, 1);
}
