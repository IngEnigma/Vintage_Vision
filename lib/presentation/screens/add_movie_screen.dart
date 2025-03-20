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
        toolbarHeight: 130,
        titleSpacing: 40,
        title: const Text(
          'Añadir',
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
              CustomInputWidget(
                controller: TextEditingController(),
                obscureText: false,
                hintText: 'Título',
              ),
              SizedBox(height: AppSize.height(context) * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 155.0,
                    child: CustomInputWidget(
                    controller: TextEditingController(),
                    obscureText: false,
                    hintText: 'Año',
                  )
                  ),
                  SizedBox(
                    width: 155.0,
                    child: CustomInputWidget(
                    controller: TextEditingController(),
                    obscureText: false,
                    hintText: 'Genero',
                  )
                  ),
                ],
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
              SizedBox(height: AppSize.height(context) * 0.08),
              ButtonRedWidget(
                text: 'Crear',
                onPressed: () {
                  // Acción para crear la película
                },
              ),
              SizedBox(
                height: AppSize.height(context) * 0.05,
              ), // Espacio adicional
              // Fila de botones con símbolos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Botón +
                  InkWell(
                    onTap: () {
                      // Lógica para botón +
                    },
                    child: Container(
                      width: 80, // Ancho del botón
                      height: 50, // Alto del botón
                      decoration: BoxDecoration(
                        color: AppColors.vintageRed,
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.vintageCream,
                        size: 40,
                      ),
                    ),
                  ),

                  // Botón -
                  InkWell(
                    onTap: () {
                    },
                    child: Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                         color: AppColors.vintageRed,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: AppColors.vintageCream,
                        size: 40,
                      ),
                    ),
                  ),

                  // Botón reiniciar
                  InkWell(
                    onTap: () {
                      // Lógica para botón reiniciar
                    },
                    child: Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                         color: AppColors.vintageRed,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Icon(
                        Icons.autorenew,
                        color:AppColors.vintageCream,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
