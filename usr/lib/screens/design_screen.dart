import 'package:flutter/material.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طرق التصميم'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'مراحل تصميم الهوائي',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildDesignStep(
              context,
              '1. تحديد المتطلبات (Specifications)',
              'تحديد التردد المطلوب للتشغيل، عرض النطاق الترددي، الكسب، الاتجاهية، الاستقطاب، والقيود الفيزيائية مثل الحجم والوزن.',
            ),
            _buildDesignStep(
              context,
              '2. اختيار نوع الهوائي (Antenna Selection)',
              'بناءً على المتطلبات السابقة يتم اختيار النوع الأنسب. مثلاً إذا كان المطلوب حجم صغير للهواتف يتم اختيار Microstrip، وإذا كان كسب عالي للستالايت يتم اختيار Parabolic.',
            ),
            _buildDesignStep(
              context,
              '3. التصميم التحليلي (Analytical Design)',
              'استخدام المعادلات الرياضية الأولية لحساب الأبعاد التقريبية للهوائي (مثل حساب الطول الموجي λ ثم تحديد طول الهوائي كـ λ/2 أو λ/4).',
            ),
            _buildDesignStep(
              context,
              '4. المحاكاة البرمجية (Software Simulation)',
              'استخدام برامج المحاكاة المتقدمة مثل CST Microwave Studio أو HFSS أو ADS لرسم الهوائي ومحاكاة أدائه، ومن ثم تحسين الأبعاد (Optimization) للوصول لأفضل أداء.',
            ),
            _buildDesignStep(
              context,
              '5. التصنيع والقياس (Fabrication & Measurement)',
              'بعد التأكد من نتائج المحاكاة، يتم تصنيع الهوائي كنموذج أولي، وقياس معاييره عملياً باستخدام أجهزة مثل محلل الشبكات الموجه (VNA) ومقارنتها بنتائج المحاكاة.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesignStep(BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
