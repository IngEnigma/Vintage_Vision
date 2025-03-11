import 'package:vintage_vision/presentation/widgets/custom_text_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String textButton;
  final Widget? child;

  const CardWidget({
    super.key,
    required this.title,
    required this.textButton,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.height(context) * 0.60,
      width: AppSize.width(context) * 0.95,
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
              padding: EdgeInsets.only(
                left: AppSize.width(context) * 0.05,
                top: AppSize.height(context) * 0.03,
                bottom: AppSize.height(context) * 0.018,
              ),
              color: AppColors.vintageDarkBlue,
              child: CustomTextWidget(
                text: title,
                fontSize: 35,
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(context) * 0.05,
                  vertical: AppSize.height(context) * 0.02,
                ),
                child: Column(
                  children: [if (child != null) Expanded(child: child!)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
