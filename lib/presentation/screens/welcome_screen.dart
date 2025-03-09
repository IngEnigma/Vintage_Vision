import 'package:vintage_vision/presentation/widgets/button_dark_blue_widget.dart';
import 'package:vintage_vision/presentation/widgets/movie_projector_icon.dart';
import 'package:vintage_vision/presentation/widgets/main_logo_icon.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
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
          children: [
            SizedBox(height: AppSize.height(context) * 0.047),
            MainLogoWidget(),
            SizedBox(height: AppSize.height(context) * 0.05),
            MovieProjectorWidget(),
            SizedBox(height: AppSize.height(context) * 0.073),
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
