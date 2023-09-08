import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final controller;
  final String hintText;
  final bool isObscure;
  final String? Function(String?)? validator;

  const CustomForm({
    super.key,
    required this.hintText,
    required this.controller,
    required this.isObscure,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        TextFormField(
          textAlign: TextAlign.center,
          validator: validator,
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 192, 201, 192))),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 193, 240, 194)),
            ),
            fillColor: const Color.fromARGB(255, 207, 240, 208),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: AutofillHints.birthday,
              color: Colors.black,
            ),
            filled: true,
          ),
        ),
      ]),
    );
  }
}
