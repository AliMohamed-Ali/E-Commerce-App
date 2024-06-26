import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/utils/app_theme.dart';
import 'package:e_commerce_app/utils/router.dart';
import 'package:e_commerce_app/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: const AppTheme().themeData,
        onGenerateRoute: generateRoute,
        initialRoute: AppRoutes.landingPageRoute,
      ),
    );
  }
}
