// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:vintage_vision/core/models/profile_model.dart';
import 'package:vintage_vision/core/services/auth_services.dart';
import 'package:vintage_vision/presentation/widgets/button_red_widget.dart';
import 'package:vintage_vision/presentation/widgets/custom_input_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/presentation/widgets/profile_card_widget.dart';
import 'package:vintage_vision/routes/routes.dart'; // Asegúrate de importar esto

class EditperfilScreen extends StatefulWidget {
  const EditperfilScreen({super.key});

  @override
  State<EditperfilScreen> createState() => _EditperfilScreenState();
}

class _EditperfilScreenState extends State<EditperfilScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _nameController = TextEditingController();

  late Profile _editableProfile;
  // ignore: unused_field
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await _authService.getCurrentProfile();
    if (profile != null) {
      setState(() {
        _editableProfile = profile;
        _nameController.text = profile.name;
        _isLoading = false;
      });
    }
  }

  Future<void> _updateProfile() async {
    if (_nameController.text.isEmpty) return;

    final updatedProfile = Profile(
      id: _editableProfile.id,
      name: _nameController.text,
      avatarUrl: _editableProfile.avatarUrl,
    );

    final success = await _authService.updateProfile(updatedProfile);

    if (success) {
      await _authService.setCurrentProfile(updatedProfile);

      setState(() {
        _editableProfile = updatedProfile;
        _nameController.text = updatedProfile.name;
      });

      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(const SnackBar(content: Text('Perfil actualizado')));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al actualizar el perfil')),
      );
    }
  }

  Future<void> _deleteProfile() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('¿Eliminar perfil?'),
            content: const Text(
              '¿Estás seguro de que quieres eliminar este perfil? Esta acción no se puede deshacer.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Eliminar'),
              ),
            ],
          ),
    );

    if (confirm == true) {
      final success = await _authService.deleteProfile(_editableProfile.id);
      if (success) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.profiles,
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al eliminar el perfil')),
        );
      }
    }
  }

  Future<void> _selectAvatar(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder:
          (_) => SimpleDialog(
            title: const Text('Selecciona un avatar'),
            children: [
              _avatarOption(context, 'https://i.pravatar.cc/150?img=3'),
            ],
          ),
    );

    if (selected != null) {
      setState(() {
        _editableProfile = Profile(
          id: _editableProfile.id,
          name: _editableProfile.name,
          avatarUrl: selected,
          viewingHistory: _editableProfile.viewingHistory,
        );
      });
    }
  }

  Widget _avatarOption(BuildContext context, String url) {
    return SimpleDialogOption(
      onPressed: () => Navigator.pop(context, url),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(url)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(url.split('/').last, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (_nameController == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      backgroundColor: AppColors.vintageDarkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.vintageDarkBlue,
        toolbarHeight: 100,
        titleSpacing: 32,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.vintageCream),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.confiperfil,
              (route) => false,
            );
          },
        ),
        title: const Text(
          'Editar Perfil',
          style: TextStyle(
            color: AppColors.vintageCream,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Limelight',
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _selectAvatar(context),
                child: Transform.scale(
                  scale: 2,
                  child: ProfileCardWidget(
                    profileName: '',
                    imageUrl:
                        'lib/assets/images/user_icon.png', // Ícono local temporal
                    onTap: () => _selectAvatar(context),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: CustomInputWidget(
                  controller: _nameController,
                  obscureText: false,
                  hintText: 'Username',
                ),
              ),
              const SizedBox(height: 100),
              ButtonRedWidget(
                text: 'Eliminar Perfil',
                onPressed: _deleteProfile,
              ),
              const SizedBox(height: 30),
              ButtonRedWidget(
                text: 'Guardar Cambios',
                onPressed: _updateProfile,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
