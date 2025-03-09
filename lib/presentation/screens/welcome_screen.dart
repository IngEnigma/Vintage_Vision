import 'package:vintage_vision/presentation/widgets/button_dark_blue_widget.dart';
import 'package:vintage_vision/presentation/widgets/movie_projector_widget.dart';
import 'package:vintage_vision/presentation/widgets/main_logo_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/routes/routes.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
            SizedBox(height: 40),
            MovieProjectorWidget(),
            SizedBox(height: 60),
            ButtonDarkBlueWidget(
              text: 'Log in',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
