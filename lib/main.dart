import 'package:e_commerce_app/utils/router.dart';
import 'package:e_commerce_app/utils/routes.dart';
import 'package:e_commerce_app/views/page/landing_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDB3022),
          background: const Color(0xFFF9F9F9),
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: generateRoute,
      initialRoute: AppRoutes.loginPageRoute,
    );
  }
}
