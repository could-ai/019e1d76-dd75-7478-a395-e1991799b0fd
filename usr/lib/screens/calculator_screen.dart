import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _freqController = TextEditingController();
  double? _wavelength;
  double? _halfWavelength;
  double? _quarterWavelength;

  // Speed of light in m/s
  final double c = 299792458.0;

  void _calculate() {
    final freqString = _freqController.text;
    if (freqString.isEmpty) return;

    final freqMHz = double.tryParse(freqString);
    if (freqMHz == null || freqMHz <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إدخال تردد صحيح أكبر من الصفر.')),
      );
      return;
    }

    // Convert MHz to Hz
    final freqHz = freqMHz * 1000000;

    setState(() {
      _wavelength = c / freqHz;
      _halfWavelength = _wavelength! / 2;
      _quarterWavelength = _wavelength! / 4;
    });
  }

  @override
  void dispose() {
    _freqController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حاسبة الهوائيات'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'حساب الطول الموجي وأبعاد الهوائي الأساسية',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _freqController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'التردد (بالميجا هرتز MHz)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.waves),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculate,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'احسب',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 32),
            if (_wavelength != null) ...[
              _buildResultCard('الطول الموجي الكامل (λ)', _wavelength!),
              _buildResultCard('نصف الطول الموجي (λ/2)', _halfWavelength!),
              _buildResultCard('ربع الطول الموجي (λ/4)', _quarterWavelength!),
              const SizedBox(height: 16),
              const Text(
                '* يتم استخدام λ/2 عادة لهوائي Dipole، و λ/4 لهوائي Monopole.',
                style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(String label, double value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              '${value.toStringAsFixed(4)} متر',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
