import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/routes/routes.dart';
import 'package:vintage_vision/presentation/widgets/profile_card_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key}); //Añadido el parámetro key

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.vintageRed,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.vintageCream,
            width: 4.0,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20), // Espaciado vertical general
          children: [
            // Sección de perfil y búsqueda
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  const SizedBox(height: 30), 
                  ProfileCardWidget(
                    profileName: 'User',
                    imageUrl: 'lib/assets/images/user_icon.png',
                    onTap: () {
                      // Aquí puedes añadir la lógica para manejar el tap en el perfil
                    },
                  ),
                  const SizedBox(height: 20), // Separación entre perfil y búsqueda
                  CustomInputWidget(
                    hintText: 'Buscar...',
                    controller: TextEditingController(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 45), 
            ..._buildButtonsWithSpacing(context),
          ],
        ),
      ),
    );
  }
  List<Widget> _buildButtonsWithSpacing(BuildContext context) {
    final buttons = [
      _buildButton(
        'Editar Perfil',
        () => Navigator.pushNamed(context, AppRoutes.editperfil),
      ),
      _buildButton(
        'Cambiar Perfil',
        () => Navigator.pop(context),
      ),
      _buildButton(
        'Añadir película',
        () => Navigator.pushNamed(context, AppRoutes.addmovie),
      ),
      _buildButton(
        'Cerrar Sesión',
        () => Navigator.pop(context),
      ),
    ];

    return buttons.expand((button) => [button, const SizedBox(height: 50)]).toList()
      ..removeLast(); // Eliminar el último SizedBox adicional
  }

  Widget _buildButton(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.vintageDarkBlue,
          foregroundColor: AppColors.vintageCream,
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          minimumSize: const Size(80, 30), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Limelight',
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}