import 'package:flutter/material.dart';

class GeneralitiesScreen extends StatelessWidget {
  const GeneralitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عموميات حول الهوائيات'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              context,
              'ما هو الهوائي؟',
              'الهوائي (Antenna) هو جهاز كهربائي يحول الطاقة الكهربائية إلى موجات كهرومغناطيسية (في حالة الإرسال) أو يحول الموجات الكهرومغناطيسية إلى طاقة كهربائية (في حالة الاستقبال). يُعتبر الهوائي عنصراً أساسياً في جميع أنظمة الاتصالات اللاسلكية.',
            ),
            const SizedBox(height: 16),
            _buildSection(
              context,
              'مبدأ العمل الأساسي',
              'يعتمد عمل الهوائي على مبدأ إشعاع الموجات الكهرومغناطيسية. عند مرور تيار متردد في موصل، تتولد مجالات كهربائية ومغناطيسية متغيرة حوله، وتنتشر هذه المجالات في الفضاء على شكل موجات.',
            ),
            const SizedBox(height: 16),
            _buildSection(
              context,
              'المعلمات الأساسية للهوائي',
              '• التردد الرنيني (Resonant Frequency): التردد الذي يكون عنده الهوائي أكثر كفاءة.\n'
              '• عرض النطاق الترددي (Bandwidth): نطاق الترددات التي يعمل ضمنها الهوائي بكفاءة مقبولة.\n'
              '• الاتجاهية (Directivity): قدرة الهوائي على تركيز الطاقة المشعة في اتجاه معين.\n'
              '• الكسب (Gain): مقياس لمدى قدرة الهوائي على إرسال أو استقبال الإشارات في اتجاه معين مقارنة بهوائي مرجعي.\n'
              '• الممانعة (Impedance): مقاومة الهوائي للتيار المتردد، ويجب مطابقتها مع ممانعة كابل التوصيل.\n'
              '• الاستقطاب (Polarization): اتجاه المجال الكهربائي للموجة الكهرومغناطيسية المنبعثة.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const Divider(),
            const SizedBox(height: 8),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.6,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
