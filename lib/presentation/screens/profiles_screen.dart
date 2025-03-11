import 'package:vintage_vision/presentation/widgets/profile_card_widget.dart';
import 'package:vintage_vision/presentation/widgets/main_logo_icon.dart';
import 'package:vintage_vision/presentation/widgets/card_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:vintage_vision/routes/routes.dart';
import 'package:flutter/material.dart';

class ProfilesScreen extends StatelessWidget {
  const ProfilesScreen({super.key});

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
                title: 'Perfiles',
                child: Column(
                  children: [
                    SizedBox(height: AppSize.height(context) * 0.02),
                    Wrap(
                      spacing: 40,
                      runSpacing: 35,
                      children: [
                        ProfileCardWidget(
                          profileName: 'Enigma',
                          imageUrl: 'lib/assets/images/user_icon.png',
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.welcome);
                          },
                        ),
                        ProfileCardWidget(
                          profileName: 'Mariano',
                          imageUrl: 'lib/assets/images/user_icon.png',
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.welcome);
                          },
                        ),
                        ProfileCardWidget(
                          profileName: 'Adsoft',
                          imageUrl: 'lib/assets/images/user_icon.png',
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.welcome);
                          },
                        ),
                        ProfileCardWidget(
                          imageUrl: 'lib/assets/images/add_icon.png',
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.welcome);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
