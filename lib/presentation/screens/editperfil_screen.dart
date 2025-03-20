import 'package:flutter/material.dart';
import 'package:vintage_vision/presentation/widgets/button_red_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:vintage_vision/presentation/widgets/profile_card_widget.dart';
class EditperfilScreen extends StatelessWidget {
  const EditperfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vintageDarkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.vintageDarkBlue,
        toolbarHeight: 100,
        titleSpacing: 40,
        title: const Text(
          'Editar Perfil',
          style: TextStyle(
            color: AppColors.vintageCream,
            fontSize: 38,
            fontWeight: FontWeight.bold,
            fontFamily: 'Limelight',
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Transform.scale(
                scale: 2,
                child: ProfileCardWidget(
                  profileName: '',
                  imageUrl: 'lib/assets/images/user_icon.png',
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 20), 
              SizedBox(
                width: 300,
                child: CustomInputWidget(
                controller: TextEditingController(),
                obscureText: false,
                hintText: 'Username',
              ),
              ),
              const SizedBox(height: 100), 
              SizedBox(height: AppSize.height(context) * 0.03),
              ButtonRedWidget(
                text: 'Editar Perfil',
                onPressed: () {
                  // Acción para crear la película
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}