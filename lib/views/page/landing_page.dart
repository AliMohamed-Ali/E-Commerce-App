import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/views/page/auth_page.dart';
import 'package:e_commerce_app/views/page/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user == null) {
              return const AuthPage();
            }
            return BottomNavBar();
          }
          return const Scaffold(
            body: Center(
              child: Text("Loading..."),
            ),
          );
        });
  }
}
