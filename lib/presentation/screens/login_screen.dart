import 'package:vintage_vision/presentation/widgets/main_logo_widget.dart';
import 'package:vintage_vision/presentation/widgets/card_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/routes/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vintageRed,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            MainLogoWidget(),
            SizedBox(height: 70),
            CardWidget(
              title: 'Bienvenido',
              text: 'Log in',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.welcome);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
