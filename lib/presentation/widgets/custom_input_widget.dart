import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final EdgeInsetsGeometry? padding;

  const CustomInputWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.82,
      height: MediaQuery.of(context).size.height * 0.055,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.vintageCream,
        borderRadius: BorderRadius.zero,
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
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
