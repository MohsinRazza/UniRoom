import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/main_wrapper.dart';

void main() {
  runApp(const UniRoomApp());
}

class UniRoomApp extends StatelessWidget {
  const UniRoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniRoom',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainWrapper(),
    );
  }
}
