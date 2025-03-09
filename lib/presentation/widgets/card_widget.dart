import 'package:vintage_vision/presentation/widgets/button_dark_blue_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_text_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onPressed;

  const CardWidget({
    super.key,
    required this.title,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.55,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: AppColors.vintageCream, width: 8),
        ),
        color: AppColors.vintageRed,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, top: 25, bottom: 15),
              color: AppColors.vintageDarkBlue,
              child: CustomTextWidget(
                text: title,
                fontSize: 40,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 30),
            CustomInputWidget(
              controller: TextEditingController(),
              obscureText: false,
              hintText: 'Username',
            ),
            SizedBox(height: 20),
            ButtonDarkBlueWidget(text: text, onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
