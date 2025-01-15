import 'package:calculator/core/configs/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color? color;

  final VoidCallback onTap;

  const CalculatorButton(
      {super.key, required this.text, this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: text == '' ? AppColors.transparent : AppColors.f272a32,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
