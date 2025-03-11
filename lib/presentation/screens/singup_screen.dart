import 'package:vintage_vision/presentation/widgets/button_dark_blue_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/presentation/widgets/text_button_widget.dart';
import 'package:vintage_vision/presentation/widgets/main_logo_icon.dart';
import 'package:vintage_vision/presentation/widgets/card_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:vintage_vision/routes/routes.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                title: 'Registro',
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
                      obscureText: false,
                      hintText: 'Email',
                    ),
                    SizedBox(height: AppSize.height(context) * 0.02),
                    CustomInputWidget(
                      controller: TextEditingController(),
                      obscureText: true,
                      hintText: 'Password',
                    ),
                    SizedBox(height: AppSize.height(context) * 0.02),
                    CustomInputWidget(
                      controller: TextEditingController(),
                      obscureText: true,
                      hintText: 'Confirm Password',
                    ),
                    SizedBox(height: AppSize.height(context) * 0.01),
                    TextButtonWidget(
                      text: 'No tienes una cuenta con nosotros?',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.login);
                      },
                    ),
                    TextButtonWidget(
                      text: "Click aqui",
                      color: AppColors.vintageDarkBlue,
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.login);
                      },
                    ),
                    SizedBox(height: AppSize.height(context) * 0.01),
                    ButtonDarkBlueWidget(
                      text: 'Sing in',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.profiles);
                      },
                    ),
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
