import 'package:flutter/material.dart';

class ExcerciseTyp extends StatelessWidget {
  final String excerciseType;
  final bool isselected;
  final VoidCallback onTap;

  ExcerciseTyp({
    required this.excerciseType,
    required this.isselected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          excerciseType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isselected ? Colors.amber[300] : Colors.white,
          ),
        ),
      ),
    );
  }
}
