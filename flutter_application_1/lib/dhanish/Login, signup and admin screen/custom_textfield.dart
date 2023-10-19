import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor:const Color.fromARGB(255, 22, 65, 109),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(90, 255, 255, 255),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon:
            const Icon(Icons.person, color: Color.fromARGB(255, 255, 255, 255)),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear, color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => controller.clear(),
        ),
      ),
    );
  }
}
