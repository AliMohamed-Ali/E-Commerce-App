import 'package:e_commerce_app/controller/auth_controller.dart';
import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/utils/routes.dart';
import 'package:e_commerce_app/views/widget/app_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  submitFn(AuthController modal) async {
    try {
      await modal.submit();
      if(!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRoutes.bottomNavRoute);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('The password provided is too weak.')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('The account already exists for that email.')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final auth = Provider.of<AuthBase>(context);

    return ChangeNotifierProvider<AuthController>(
      create: (_) => AuthController(auth: auth),
      child: Consumer<AuthController>(
        builder: (_, modal, __) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Form(
                  key: modal.formKey,
                  child: Column(
                    children: [
                      Text(
                        modal.isLogin ? "Login" : "Signup",
                        style: textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 64),
                      TextFormField(
                        onChanged: modal.updaetEmail,
                        focusNode: modal.emailFocusNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(modal.passwordFocusNode),
                        textInputAction: TextInputAction.next,
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
                        onChanged: modal.updaetPassword,
                        focusNode: modal.passwordFocusNode,
                        obscureText: modal.isObscured,
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
                                onPressed: modal.toggleObscure,
                                icon: !modal.isObscured
                                    ? Icon(Icons.visibility,
                                        color: colorScheme.primary)
                                    : const Icon(Icons.visibility_off))),
                      ),
                      const SizedBox(height: 16),
                      modal.isLogin
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
                          text: modal.isLogin ? "Login" : "Signup",
                          onPressed: () => submitFn(modal)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(modal.isLogin
                              ? "Don't have an account?"
                              : "Already have an account?"),
                          TextButton(
                              onPressed: modal.toggleAuthType,
                              child: Text(modal.isLogin ? "Signup" : "Login")),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Text(modal.isLogin
                          ? "Or login with social account"
                          : "Or signup with social account"),
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
        },
      ),
    );
  }
}
