import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:vintage_vision/presentation/widgets/button_dark_blue_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/presentation/widgets/text_button_widget.dart';
import 'package:vintage_vision/presentation/widgets/main_logo_icon.dart';
import 'package:vintage_vision/presentation/widgets/card_widget.dart';
import 'package:vintage_vision/routes/routes.dart';
import 'package:vintage_vision/presentation/widgets/password_input_widget.dart';

import 'package:vintage_vision/core/services/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _login() async {
    final user = await _authService.login(
      _emailController.text,
      _passwordController.text,
    );
    if (user != null) {
      if (!mounted) return;
      Navigator.pushNamed(context, AppRoutes.profiles);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en login: Usuario no encontrado')),
      );
    }
  }

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
                title: 'Bienvenido',
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomInputWidget(
                      controller: _emailController,
                      obscureText: false,
                      hintText: 'Email',
                    ),
                    SizedBox(height: AppSize.height(context) * 0.02),
                    PasswordInputWidget(
                      controller: _passwordController,
                      hintText: 'Password',
                    ),
                    SizedBox(height: AppSize.height(context) * 0.04),
                    TextButtonWidget(
                      text: 'No tienes una cuenta con nosotros?',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.singup);
                      },
                    ),
                    TextButtonWidget(
                      text: "Click aqui",
                      color: AppColors.vintageDarkBlue,
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.singup);
                      },
                    ),
                    SizedBox(height: AppSize.height(context) * 0.13),
                    ButtonDarkBlueWidget(text: 'Log in', onPressed: _login),
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