import 'package:vintage_vision/presentation/widgets/custom_text_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  final String profileName;
  final VoidCallback onTap;
  final IconData? icon;
  final double imageSizeFactor;

  const ProfileCardWidget({
    super.key,
    required this.profileName,
    required this.onTap,
    this.icon = Icons.add,
    this.imageSizeFactor = 0.8,
  });

  @override
  Widget build(BuildContext context) {
    double size = AppSize.width(context) * 0.3;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.vintageDarkBlue, width: 5),
            ),
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
                  icon,
                  size: size * imageSizeFactor,
                  color: AppColors.vintageCream,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
