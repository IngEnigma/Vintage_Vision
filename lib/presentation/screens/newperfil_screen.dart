import 'package:flutter/material.dart';
import 'package:vintage_vision/core/services/auth_services.dart';
import 'package:vintage_vision/presentation/widgets/button_dark_blue_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/presentation/widgets/main_logo_icon.dart';
import 'package:vintage_vision/presentation/widgets/card_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:vintage_vision/routes/routes.dart';

class NewperfilScreen extends StatefulWidget {
  NewperfilScreen({super.key});

  @override
  State<NewperfilScreen> createState() => _NewperfilScreenState();
}

class _NewperfilScreenState extends State<NewperfilScreen> {
  final ValueNotifier<bool> modoNinos = ValueNotifier(false);
  final TextEditingController usernameController = TextEditingController();

  final AuthService _authService = AuthService();
  bool _isLoading = false;

  Future<void> _createProfile() async {
    if (usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor ingresa un nombre para el perfil')),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Selecciona un avatar basado en el modo niños
    final avatarUrl = modoNinos.value 
        ? 'assets/images/user_icon.png'
        : 'assets/images/user_icon.png';

    final success = await _authService.createProfile(
      usernameController.text,
      avatarUrl,
      modoNinos.value,
    );

    setState(() => _isLoading = false);

    if (success) {
      // Navegar a la pantalla de perfiles y recargar
      Navigator.pushReplacementNamed(context, AppRoutes.profiles);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al crear el perfil')),
      );
    }
  }

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
                title: 'Nuevo Perfil',
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomInputWidget(
                      controller: usernameController,
                      obscureText: false,
                      hintText: 'Username',
                    ),
      
                    ValueListenableBuilder<bool>(
                      valueListenable: modoNinos,
                      builder: (context, value, child) {
                        return Row(
                          children: [
                            Checkbox(
                              value: value,
                              activeColor: AppColors.vintageCream, // Color del checkbox cuando está seleccionado
                              checkColor: AppColors.vintageDarkBlue, // Color del "check" dentro del checkbox
                              onChanged: (newValue) {
                                modoNinos.value = newValue ?? false;
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                modoNinos.value = !modoNinos.value;
                              },
                              child: Text(
                                'Modo para niños',
                                style: TextStyle(
                                  color: AppColors.vintageDarkBlue,
                                  fontSize: 18, 
                                  fontFamily: 'Limelight',
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: AppSize.height(context) * 0.20),
                    ButtonDarkBlueWidget(
                      text: 'Crear',
                      onPressed: _createProfile,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}