import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';

class PasswordInputWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final EdgeInsetsGeometry? padding;

  const PasswordInputWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.padding,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PasswordInputWidgetState createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.82,
      height: MediaQuery.of(context).size.height * 0.055,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.vintageCream,
        borderRadius: BorderRadius.zero,
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: TextStyle(
          fontSize: 20,
          color: AppColors.vintageDarkBlue,
          fontFamily: 'LilyScriptOne',
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 20,
            color: AppColors.vintageDarkBlue,
            fontFamily: 'LilyScriptOne',
          ),
          contentPadding: const EdgeInsets.only(left: 15, bottom: 1),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.vintageRed, width: 3),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.vintageRed, width: 3),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.vintageDarkBlue,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}