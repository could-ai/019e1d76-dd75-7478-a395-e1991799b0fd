import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الهوائيات وتصميمها'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth > 800 ? 4 : constraints.maxWidth > 500 ? 2 : 1;
          return GridView.count(
            crossAxisCount: crossAxisCount,
            padding: const EdgeInsets.all(16),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.5,
            children: [
              _buildMenuCard(
                context: context,
                title: 'عموميات ومفاهيم',
                icon: Icons.lightbulb_outline,
                route: '/generalities',
                color: Colors.amber.shade100,
              ),
              _buildMenuCard(
                context: context,
                title: 'أنواع الهوائيات',
                icon: Icons.category_outlined,
                route: '/types',
                color: Colors.blue.shade100,
              ),
              _buildMenuCard(
                context: context,
                title: 'طرق التصميم',
                icon: Icons.design_services_outlined,
                route: '/design',
                color: Colors.green.shade100,
              ),
              _buildMenuCard(
                context: context,
                title: 'حاسبة الطول الموجي',
                icon: Icons.calculate_outlined,
                route: '/calculator',
                color: Colors.purple.shade100,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String route,
    required Color color,
  }) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: color,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.black87),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}