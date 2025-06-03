import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/routes/routes.dart';

class CustomAppBar extends StatelessWidget {
  final String profileName;
  const CustomAppBar({super.key, required this.profileName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 24.0,
      ),
      color: AppColors.vintageDarkBlue,
      child: SafeArea(
        child: Row(
          children: [
            // Logo
            SizedBox(
              child: Image.asset('lib/assets/images/logo.png', fit: BoxFit.contain),
            ),
            
            const Spacer(), // Espacio flexible entre logo e iconos
            
            // Icono de búsqueda (lupa)
            IconButton(
              icon: Icon(
                Icons.search,
                color: AppColors.vintageCream,
                size: 28,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/search'); // Navega a la pantalla de búsqueda
              },
            ),
            
            const SizedBox(width: 8.0),
            
            // Icono de usuario (reemplaza el menú)
            GestureDetector(
              onTap: () {
                 Navigator.pushNamed(context, AppRoutes.confiperfil);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.vintageCream,
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.vintageDarkBlue,
                  child: Icon(
                    Icons.person,
                    color: AppColors.vintageCream,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}