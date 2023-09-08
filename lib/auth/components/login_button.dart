import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final void Function()? onTap;
  const ButtonLogin({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 18, 90, 17),
            borderRadius: BorderRadius.circular(9.5)),
        child: const Center(
          child: Text(
            "Entrar",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
