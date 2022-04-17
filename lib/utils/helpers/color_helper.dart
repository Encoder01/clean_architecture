import 'package:flutter/material.dart';

class ColorHelpers{
 
  static const Color primary = Color(0xFF00C569);
  static const Color primaryDark = Color(0xFF00C569);
  static const Color primaryLight = Color(0xFF00C569);
  static const Color secondary = Color(0xFF00C569);
  static const Color secondaryDark = Color(0xFF00C569);
  static const Color secondaryLight = Color(0xFF00C569);
  static const Color background = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFFF5F5F5);
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color error = Color(0xFFF44336);
  static const Color errorDark = Color(0xFFF44336);
  static const Color errorLight = Color(0xFFF44336);
  static const Color success = Color(0xFF4CAF50);
  static const Color successDark = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color warningDark = Color(0xFFFFC107);
  static const Color warningLight = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);
  static const Color infoDark = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFF2196F3);
  static const Color text = Color(0xFF212121);
  static const Color textDark = Color(0xFF212121);
  static const Color textLight = Color(0xFF212121);
  static const Color icon = Color(0xFF757575);
  static const Color iconDark = Color(0xFF757575);
  static const Color iconLight = Color(0xFF757575);
  static const Color divider = Color(0xFFBDBDBD);
  static const Color dividerDark = Color(0xFFBDBDBD);
  static fromHexString(String hex){
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) {
      hex = "FF" + hex;
    }
    if (hex.length == 8) {
      return int.parse(hex.substring(0, 8), radix: 16);
    }
    return 0;
  }
}

 