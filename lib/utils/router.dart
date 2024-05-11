import 'package:e_commerce_app/utils/routes.dart';
import 'package:e_commerce_app/views/page/landing_page.dart';
import 'package:e_commerce_app/views/page/auth_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.authPageRoute:
      return MaterialPageRoute(builder: (_) => const AuthPage());
    case AppRoutes.landingPageRoute:
    default:
      return MaterialPageRoute(builder: (_) => const LandingPage());
  }
}
