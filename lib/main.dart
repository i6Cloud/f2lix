import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() => runApp(const F2lixApp());

class F2lixApp extends StatelessWidget {
  const F2lixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F2LIX',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      home: const HomeScreen(),
    );
  }
}
