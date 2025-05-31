import 'package:vintage_vision/presentation/widgets/custom_text_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  final String? profileName;
  final VoidCallback onTap;
  final String? imageUrl;
  final IconData? icon;
  final double imageSizeFactor;

  const ProfileCardWidget({
    super.key,
    required this.onTap,
    this.profileName,
    this.imageUrl,
    this.icon,
    this.imageSizeFactor = 0.75,
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
              child: ClipOval(
                child: Padding(
                  padding: EdgeInsets.all(size * 0.05),
                  child: SizedBox(
                    width: size * imageSizeFactor,
                    height: size * imageSizeFactor,
                    child: imageUrl != null
                      ? (imageUrl!.startsWith('http')
                          ? Image.network(imageUrl!, fit: BoxFit.cover)
                          : Image.asset(imageUrl!, fit: BoxFit.cover))
                      : Icon(
                          icon ?? Icons.person,
                          size: size * imageSizeFactor,
                          color: AppColors.vintageCream,
                        ),

                  ),
                ),
              ),
            ),
          ),
        ),
        if (profileName != null) ...[
          SizedBox(height: 5),
          CustomTextWidget(
            text: profileName ?? "Nombre no disponible", // Texto por defecto
            fontSize: 23,
            color: AppColors.vintageDarkBlue,
          ),
        ],
      ],
    );
  }
}
