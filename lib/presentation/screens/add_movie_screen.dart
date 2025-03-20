import 'package:flutter/material.dart';
import 'package:vintage_vision/presentation/widgets/button_red_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_textarea_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';

class AddMovieScreen extends StatelessWidget {
  const AddMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vintageDarkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.vintageDarkBlue,
        title: const Text(
          'Añadir Película',
          style: TextStyle(
            color: AppColors.vintageCream,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'LilyScriptOne',
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
              CustomInputWidget(
                controller: TextEditingController(),
                obscureText: false,
                hintText: 'Título',
              ),
              SizedBox(height: AppSize.height(context) * 0.02),
              CustomInputWidget(
                controller: TextEditingController(),
                obscureText: false,
                hintText: 'Año',
              ),
              SizedBox(height: AppSize.height(context) * 0.02),
              CustomInputWidget(
                controller: TextEditingController(),
                obscureText: false,
                hintText: 'Género',
              ),
              SizedBox(height: AppSize.height(context) * 0.02),
              CustomInputWidget(
                controller: TextEditingController(),
                obscureText: false,
                hintText: 'Póster (URL)',
              ),
              SizedBox(height: AppSize.height(context) * 0.02),
              CustomTextAreaWidget(
                controller: TextEditingController(),
                hintText: 'Sinopsis',
              ),
              SizedBox(height: AppSize.height(context) * 0.03),
              ButtonRedWidget(
                text: 'Crear',
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