import 'package:e_commerce_app/utils/enums.dart';
import 'package:e_commerce_app/utils/routes.dart';
import 'package:e_commerce_app/views/widget/app_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var _authType = AuthType.login;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  _authType == AuthType.login ? "Login" : "Signup",
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(height: 64),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: passwordController,
                  obscureText: isVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                          onPressed: () =>
                              setState(() => isVisible = !isVisible),
                          icon: !isVisible
                              ? Icon(Icons.visibility,
                                  color: colorScheme.primary)
                              : const Icon(Icons.visibility_off))),
                ),
                const SizedBox(height: 16),
                _authType == AuthType.login
                    ? InkWell(
                        onTap: () {},
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 24),
                AppButton(
                    text: _authType == AuthType.login ? "Login" : "Signup",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                            context, AppRoutes.landingPageRoute);
                      }
                    }),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_authType == AuthType.login
                        ? "Don't have an account?"
                        : "Already have an account?"),
                    TextButton(
                        onPressed: () {
                          if (_authType == AuthType.login) {
                            setState(() => _authType = AuthType.signup);
                          } else {
                            setState(() => _authType = AuthType.login);
                          }
                        },
                        child: Text(
                            _authType == AuthType.login ? "Signup" : "Login")),
                  ],
                ),
                const Expanded(child: SizedBox()),
                const Text("Or login with social account"),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook, color: Colors.blue),
                    SizedBox(width: 12),
                    Icon(Icons.g_mobiledata, color: Colors.red),
                    SizedBox(width: 12),
                    Icon(Icons.apple, color: Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
