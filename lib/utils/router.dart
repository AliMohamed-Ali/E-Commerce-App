import 'package:e_commerce_app/utils/routes.dart';
import 'package:e_commerce_app/views/page/bottom_nav_bar.dart';
import 'package:e_commerce_app/views/page/home.dart';
import 'package:e_commerce_app/views/page/landing_page.dart';
import 'package:e_commerce_app/views/page/auth_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homePageRoute:
      return MaterialPageRoute(builder: (_) => const HomePage(), settings: settings);
    case AppRoutes.bottomNavRoute:
      return MaterialPageRoute(builder: (_) =>  BottomNavBar(), settings: settings);
    case AppRoutes.authPageRoute:
      return MaterialPageRoute(builder: (_) => const AuthPage(), settings: settings);
    case AppRoutes.landingPageRoute:
    default:
      return MaterialPageRoute(builder: (_) => const LandingPage(), settings: settings);
  }
}
