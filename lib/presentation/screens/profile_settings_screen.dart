import 'package:flutter/material.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/models/profile_model.dart';
import 'package:vintage_vision/core/services/auth_services.dart';
import 'package:vintage_vision/routes/routes.dart';
import 'package:vintage_vision/presentation/widgets/profile_card_widget.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
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
    return Scaffold(
      backgroundColor: AppColors.vintageDarkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.vintageDarkBlue,
        title: const Text(
          'Configuración de Perfil',
          style: TextStyle(
            fontFamily: 'Limelight',
            color: AppColors.vintageCream,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.vintageCream),
          onPressed: () =>  Navigator.pushReplacementNamed(context, AppRoutes.principal)
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.vintageCream,
            width: 4.0,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Tarjeta de perfil
            ProfileCardWidget(
              profileName: _currentProfile?.name ?? 'Usuario',
              imageUrl: 'lib/assets/images/user_icon.png',
              onTap: (){},
              forceCreamText: true,
            ),
            const SizedBox(height: 40),
            
            // Botones de acciones
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildActionButton(
                    label: 'Editar Perfil',
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.editperfil),
                  ),
                  const SizedBox(height: 20),
                  _buildActionButton(
                    label: 'Cambiar Perfil',
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.profiles,
                      (route) => false,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildActionButton(
                    label: 'Subir Película',
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.addmovie),
                  ),
                  const SizedBox(height: 20),
                  _buildActionButton(
                    label: 'Editar Película',
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.editmovie),
                  ),
                  const SizedBox(height: 40),
                  _buildLogoutButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.vintageRed,
        foregroundColor: AppColors.vintageCream,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      onPressed: onPressed,
    child: Center( // Envuelve el Text en un Center
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Limelight',
          fontSize: 20,
        ),
      ),
    ),
    );
  }

  Widget _buildLogoutButton() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.vintageRed,
      foregroundColor: AppColors.vintageCream,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    ),
    onPressed: () => _logout(context),
    child: const Text(
      'Cerrar Sesión',
      style: TextStyle(
        fontFamily: 'Limelight',
        fontSize: 20,
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