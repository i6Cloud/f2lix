import 'package:flutter/material.dart';

class AppTheme {
  static const blue = Color(0xFF174EA6);
  static const bg = Color(0xFF05070B);

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: blue,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: bg,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF10141E),
        indicatorColor: blue.withValues(alpha: .35),
      ),
    );
  }
}
