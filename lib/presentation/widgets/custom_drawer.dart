import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/models/profile_model.dart';
import 'package:vintage_vision/core/services/auth_services.dart';
import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/routes/routes.dart';
import 'package:vintage_vision/presentation/widgets/profile_card_widget.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final AuthService _authService = AuthService();
  Profile? _currentProfile;

  @override
  void initState() {
    super.initState();
    _loadCurrentProfile();
  }

  Future<void> _loadCurrentProfile() async {
    final profile = await _authService.getCurrentProfile();
    setState(() {
      _currentProfile = profile;
    });
  }

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
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  ProfileCardWidget(
                    profileName: _currentProfile?.name ?? 'Usuario',
                    imageUrl: 'lib/assets/images/user_icon.png',
                    onTap: () {
                      // Acción al tocar el perfil
                    },
                  ),
                  const SizedBox(height: 20),
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
        () => Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.profiles,
          (route) => false,
        ),
      ),
      _buildButton(
        'Añadir película',
        () => Navigator.pushNamed(context, AppRoutes.addmovie),
      ),
      _buildButton(
        'Cerrar Sesión',
        () async => await _logout(context),
      ),
    ];

    return buttons.expand((button) => [button, const SizedBox(height: 50)]).toList()
      ..removeLast();
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

  Future<void> _logout(BuildContext context) async {
    try {
      await _authService.clearCurrentProfile();
      await _authService.logout();

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.welcome,
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cerrar sesión: $e')),
      );
    }
  }
}
