import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final String? fontFamily;
  final VoidCallback onPressed;

  const TextButtonWidget({
    super.key,
    required this.text,
    this.fontSize = 15,
    this.color = AppColors.vintageCream,
    this.textAlign = TextAlign.center,
    this.fontFamily = 'Limelight',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}