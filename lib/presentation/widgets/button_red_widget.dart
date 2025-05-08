import 'package:vintage_vision/presentation/widgets/custom_text_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:flutter/material.dart';

class ButtonRedWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonRedWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.vintageRed),
        minimumSize: WidgetStatePropertyAll(
          Size(AppSize.width(context) * 0.4, AppSize.height(context) * 0.06),
        ),
        maximumSize: WidgetStatePropertyAll(
          Size(AppSize.width(context) * 0.4, AppSize.height(context) * 0.06),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
      child: CustomTextWidget(
        text: text,
        fontSize: 15.0,
      ),
    );
  }
}
