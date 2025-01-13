
import 'package:flutter/material.dart';
import '../controllers/personality_test_controller.dart';
import 'personality_test_screen.dart'; 

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double heightInCm = 1;
    double heightInLogicalPixels = heightInCm * 37.8;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de Bord'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 colonnes
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2, 
          children: [
            _buildDashboardItem(
              context,
              title: 'Test de Personnalité',
              icon: Icons.psychology,
              color: Colors.purple,
              height: heightInLogicalPixels,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalityTestScreen(
                      controller: PersonalityTestController(),
                    ),
                  ),
                );
              },
            ),
            _buildDashboardItem(
              context,
              title: 'Statistiques',
              icon: Icons.bar_chart,
              color: Colors.blue,
              height: heightInLogicalPixels,
              onTap: () {
                
              },
            ),
            _buildDashboardItem(
              context,
              title: 'Paramètres',
              icon: Icons.settings,
              color: Colors.green,
              height: heightInLogicalPixels,
              onTap: () {
                
              },
            ),
            _buildDashboardItem(
              context,
              title: 'Aide',
              icon: Icons.help,
              color: Colors.orange,
              height: heightInLogicalPixels,
              onTap: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required double height,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: height, 
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 30, color: color),
                SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
