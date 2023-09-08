import 'package:flutter/material.dart';

class CreateMatchButton extends StatelessWidget {
  CreateMatchButton({super.key, required this.onTap});
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 18, 90, 17),
            borderRadius: BorderRadius.circular(20)),
        child: const Center(
          child: Text(
            "Criar Partida",
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
