import 'package:e_commerce_app/utils/routes.dart';
import 'package:e_commerce_app/views/page/landing_page.dart';
import 'package:e_commerce_app/views/page/login_page.dart';
import 'package:e_commerce_app/views/page/register_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.registerPageRoute:
      return MaterialPageRoute(builder: (_) => const RegisterPage());
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(builder: (_) => const LoginPage());
    case AppRoutes.landingPageRoute:
    default:
      return MaterialPageRoute(builder: (_) => const LandingPage());
  }
}
