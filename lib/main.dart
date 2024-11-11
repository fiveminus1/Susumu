import 'package:flutter/material.dart';
import 'app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Susumu',
      theme: AppTheme.theme,
    );
  }
}
