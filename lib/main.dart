import 'package:e_commerce_app/utils/app_theme.dart';
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
      theme: const AppTheme().themeData,
      onGenerateRoute: generateRoute,
      initialRoute: AppRoutes.authPageRoute,
    );
  }
}
