import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';

class CustomTextAreaWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextAreaWidget({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.82,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.vintageCream,
      ),
      child: TextFormField(
        controller: controller,
        maxLines: 5, // Permite escribir varias líneas
        style: const TextStyle(
          fontSize: 20,
          color: AppColors.vintageDarkBlue,
          fontFamily: 'LilyScriptOne',
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 20,
            color: AppColors.vintageDarkBlue,
            fontFamily: 'LilyScriptOne',
          ),
          contentPadding: EdgeInsets.only(left: 15, bottom: 1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.vintageRed, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.vintageRed, width: 3),
          ),
        ),
      ),
    );
  }
}