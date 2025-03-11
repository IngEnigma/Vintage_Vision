import 'package:vintage_vision/presentation/widgets/button_dark_blue_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/presentation/widgets/text_button_widget.dart';
import 'package:vintage_vision/presentation/widgets/main_logo_icon.dart';
import 'package:vintage_vision/presentation/widgets/card_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:vintage_vision/routes/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vintageRed,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.height(context) * 0.02),
              MainLogoWidget(),
              SizedBox(height: AppSize.height(context) * 0.079),
              CardWidget(
                title: 'Bienvenido',
                textButton: 'Log in',
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomInputWidget(
                      controller: TextEditingController(),
                      obscureText: false,
                      hintText: 'Username',
                    ),
                    SizedBox(height: AppSize.height(context) * 0.02),
                    CustomInputWidget(
                      controller: TextEditingController(),
                      obscureText: true,
                      hintText: 'Password',
                    ),
                    SizedBox(height: AppSize.height(context) * 0.04),
                    TextButtonWidget(
                      text: 'No tienes una cuenta con nosotros?',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.welcome);
                      },
                    ),
                    TextButtonWidget(
                      text: "Click aqui",
                      color: AppColors.vintageDarkBlue,
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.welcome);
                      },
                    ),
                    SizedBox(height: AppSize.height(context) * 0.11),
                    ButtonDarkBlueWidget(
                      text: 'Log in',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.welcome);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
