import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/generalities_screen.dart';
import 'screens/types_screen.dart';
import 'screens/design_screen.dart';
import 'screens/calculator_screen.dart';

void main() {
  runApp(const AntennasApp());
}

class AntennasApp extends StatelessWidget {
  const AntennasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الهوائيات وتصميمها',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        fontFamily: 'Roboto', // Uses system default, but ensures clean text
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/generalities': (context) => const GeneralitiesScreen(),
        '/types': (context) => const TypesScreen(),
        '/design': (context) => const DesignScreen(),
        '/calculator': (context) => const CalculatorScreen(),
      },
    );
  }
}
