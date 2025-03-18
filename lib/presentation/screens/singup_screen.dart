import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:vintage_vision/presentation/widgets/button_dark_blue_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/presentation/widgets/text_button_widget.dart';
import 'package:vintage_vision/presentation/widgets/main_logo_icon.dart';
import 'package:vintage_vision/presentation/widgets/card_widget.dart';
import 'package:vintage_vision/routes/routes.dart';
import 'package:vintage_vision/core/services/auth_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final AuthService _authService = AuthService();

  void _register() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Las contraseñas no coinciden')));
      return;
    }

    final newUser = await _authService.createUser(
      _emailController.text,
      _usernameController.text,
      false,
    );

    if (!mounted) return;
    Navigator.pushNamed(context, AppRoutes.profiles);
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
                title: 'Registro',
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomInputWidget(
                      controller: _usernameController,
                      obscureText: false,
                      hintText: 'Username',
                    ),
                    SizedBox(height: AppSize.height(context) * 0.02),
                    CustomInputWidget(
                      controller: _emailController,
                      obscureText: false,
                      hintText: 'Email',
                    ),
                    SizedBox(height: AppSize.height(context) * 0.02),
                    CustomInputWidget(
                      controller: _passwordController,
                      obscureText: true,
                      hintText: 'Password',
                    ),
                    SizedBox(height: AppSize.height(context) * 0.02),
                    CustomInputWidget(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      hintText: 'Confirm Password',
                    ),
                    SizedBox(height: AppSize.height(context) * 0.02),
                    TextButtonWidget(
                      text: '¿Ya tienes una cuenta?',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.login);
                      },
                    ),
                    SizedBox(height: AppSize.height(context) * 0.02),
                    ButtonDarkBlueWidget(text: 'Sign Up', onPressed: _register),
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
