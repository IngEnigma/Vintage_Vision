import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/presentation/widgets/main_logo_icon.dart';
import 'package:vintage_vision/presentation/widgets/card_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:flutter/material.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vintageRed,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.height(context) * 0.01),
              MainLogoWidget(),
              SizedBox(height: AppSize.height(context) * 0.07),
              CardWidget(
                title: "Nuevo Perfil",
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomInputWidget(
                      hintText: "User",
                      controller: TextEditingController(),
                    ),
                    Checkbox(value: false, onChanged: (context) {}),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
