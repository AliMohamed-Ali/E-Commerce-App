import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/utils/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthType authType;
  bool isObscured = true;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  AuthController({
    required this.auth,
    this.email = "",
    this.password = "",
    this.authType = AuthType.login,
  });
  void copyWith(
      {String? email, String? password, AuthType? authType, bool? isObscured}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authType = authType ?? this.authType;
    this.isObscured = isObscured ?? this.isObscured;
    notifyListeners();
  }

  void updaetEmail(String email) => copyWith(email: email);
  void updaetPassword(String password) => copyWith(password: password);
  void updateAuthType(AuthType authType) => copyWith(authType: authType);
  void toggleObscure() => copyWith(isObscured: !isObscured);
  bool get isLogin => authType == AuthType.login;
  bool get isValidForm => formKey.currentState!.validate();
  void toggleAuthType() {
    final newAuthType =
        authType == AuthType.login ? AuthType.signup : AuthType.login;
    formKey.currentState!.reset();
    copyWith(authType: newAuthType, email: "", password: "");
  }

  @override
  Future<void> submit() async {
    if (!isValidForm) return;
    try {
      if (isLogin) {
        await auth.loginWithEmailAndPassword(email, password);
      } else {
        await auth.registerWithEmailAndPassword(email, password);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
