// lib/presentation/widgets/custom_text_widget.dart
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final String fontFamily;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.fontSize = 24,
    this.color = AppColors.vintageCream,
    this.textAlign = TextAlign.center,
    this.fontFamily = 'Limelight',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign,
    );
  }
}
