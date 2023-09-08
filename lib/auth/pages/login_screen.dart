import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poker_manager_ui/auth/components/login_button.dart';
import 'package:poker_manager_ui/auth/components/login_text_field.dart';
import 'package:poker_manager_ui/auth/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 172, 212, 173),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 80),
            child: Column(children: [
              const Image(
                image: AssetImage('lib/assets/images/cards.png'),
                height: 150,
                width: 150,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 10),
              const Text("Bem vindos ao Poker Manager",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 65),
              CustomForm(
                validator: (value) {
                  if (value!.length <= 8 || value.isEmpty) {
                    return "Insira um valor válido com um minimo de 8 caracteres";
                  }
                  return null;
                },
                hintText: "username",
                controller: usernameController,
                isObscure: false,
              ),
              const SizedBox(height: 25),
              CustomForm(
                validator: (value) {
                  if (value!.length <= 8 || value.isEmpty) {
                    return "Insira um valor válido com um minimo de 8 caracteres";
                  }
                  return null;
                },
                hintText: "password",
                controller: passwordController,
                isObscure: true,
              ),
              const SizedBox(height: 30),
              ButtonLogin(onTap: () {
                _authService
                    .login(usernameController.text, passwordController.text)
                    .then((success) {
                  if (success) {
                    GoRouter.of(context).pushReplacement("/home");
                  }
                });
              }),
            ]),
          ),
        ),
      )),
    );
  }
}
