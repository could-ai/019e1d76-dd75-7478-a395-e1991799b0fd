import 'package:flutter/material.dart';

class TypesScreen extends StatelessWidget {
  const TypesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final types = [
      {
        'title': 'الهوائي السلكي (Wire Antenna)',
        'desc': 'أبسط أنواع الهوائيات، يتكون من سلك أو مجموعة أسلاك. مثال: الهوائي ثنائي القطب (Dipole)، والهوائي الحلقي (Loop).',
        'icon': Icons.horizontal_rule,
      },
      {
        'title': 'هوائي الفتحة (Aperture Antenna)',
        'desc': 'يحتوي على فتحة لإشعاع الموجات الكهرومغناطيسية، شائع الاستخدام في الترددات العالية (Microwave). مثال: هوائي البوق (Horn Antenna).',
        'icon': Icons.filter_center_focus,
      },
      {
        'title': 'الهوائي العاكس (Reflector Antenna)',
        'desc': 'يستخدم سطحاً عاكساً لتركيز الموجات في اتجاه معين، مما يعطي كسباً عالياً جداً. مثال: هوائي الطبق (Parabolic Dish).',
        'icon': Icons.satellite_alt,
      },
      {
        'title': 'الهوائي الشريطي (Microstrip / Patch Antenna)',
        'desc': 'يتكون من شريحة معدنية مطبوعة على مادة عازلة. يمتاز بصغر حجمه وسهولة تصنيعه، ويستخدم بكثرة في الهواتف الذكية.',
        'icon': Icons.sim_card,
      },
      {
        'title': 'مصفوفة الهوائيات (Antenna Array)',
        'desc': 'مجموعة من الهوائيات تعمل معاً لتكوين نمط إشعاعي معين لا يمكن الحصول عليه بهوائي واحد، مما يزيد من الاتجاهية.',
        'icon': Icons.apps,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('أنواع الهوائيات'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: types.length,
        itemBuilder: (context, index) {
          final type = types[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  type['icon'] as IconData,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              title: Text(
                type['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  type['desc'] as String,
                  style: const TextStyle(height: 1.5),
                ),
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
