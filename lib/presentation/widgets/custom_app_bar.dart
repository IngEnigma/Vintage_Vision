import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget {
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
            SizedBox(
              child: Image.asset('lib/assets/images/logo.png', fit: BoxFit.contain),
            ),
            const SizedBox(width: 6.0),
             const SizedBox(width: 6.0),
            // Botón del menú
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Builder( // Widget Builder esencial aquí
                  builder: (context) => IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: AppColors.vintageRed,
                      size: 32,
                    ),
                    onPressed: () {
                      print('Intentando abrir menú ayuda');
                      Scaffold.of(context).openEndDrawer(); // Método correcto
                    },
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