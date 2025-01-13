import 'package:flutter/material.dart';
import 'views/dashboard_screen.dart';

void main() {
  runApp(PersonalityTestApp());
}

class PersonalityTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test de Personnalité',
      debugShowCheckedModeBanner: false, // Désactive l'étiquette "Debug"
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardScreen(),
    );
  }
}