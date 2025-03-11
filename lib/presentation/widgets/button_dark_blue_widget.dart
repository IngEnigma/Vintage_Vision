import 'package:vintage_vision/presentation/widgets/custom_text_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:flutter/material.dart';

class ButtonDarkBlueWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonDarkBlueWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.vintageDarkBlue),
        minimumSize: WidgetStatePropertyAll(Size(230, 62)),
        maximumSize: WidgetStatePropertyAll(Size(230, 62)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
      child: CustomTextWidget(text: text),
    );
  }
}
