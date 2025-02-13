import 'package:flutter/material.dart';
import 'splash.dart';
import 'menu.dart';
import 'friendship_calculator.dart';
import 'currency_converter.dart';
import 'temperature_converter.dart';
import 'bmi_calculator.dart';
import 'length_converter.dart';
import 'area_converter.dart';
import 'volume_converter.dart';
import 'weight_mass_converter.dart';
import 'time_converter_belgium_pakistan.dart';
import 'age_calculator.dart';
import 'time_converter_hm_sec.dart';

void main() {
  runApp(const CalculatorsApp());
}

class CalculatorsApp extends StatelessWidget {
  const CalculatorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/menu': (context) => const MenuScreen(),
        '/friendship': (context) => const FriendshipCalculatorScreen(),
        '/currency': (context) => const CurrencyConverterScreen(),
        '/temperature': (context) => const TemperatureConverterScreen(),
        '/bmi': (context) => const BMICalculatorScreen(),
        '/length': (context) => const LengthConverterScreen(),
        '/area': (context) => const AreaConverterScreen(),
        '/volume': (context) => const VolumeConverterScreen(),
        '/weight': (context) => const WeightConverterScreen(),
        '/time_belgium_pakistan': (context) => const TimeConverterScreen(),
        '/age': (context) => const AgeCalculatorScreen(),
        '/time_hm_sec': (context) => const TimeConverterHoursMinutesScreen(),
      },
    );
  }
}




