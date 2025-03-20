import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:flutter/material.dart';

class AddProfileWidget extends StatelessWidget {
  final VoidCallback onTap;
  final double imageSizeFactor;

  const AddProfileWidget({
    super.key,
    required this.onTap,
    this.imageSizeFactor = 0.99,
  });

  @override
  Widget build(BuildContext context) {
    double size = AppSize.width(context) * 0.3;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.vintageDarkBlue,
          border: Border.all(color: AppColors.vintageCream, width: 3),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: size * imageSizeFactor,
            color: AppColors.vintageCream,
          ),
        ),
      ),
    );
  }
}
