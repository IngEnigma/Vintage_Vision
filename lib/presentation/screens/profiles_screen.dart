import 'package:vintage_vision/core/services/auth_services.dart';
import 'package:vintage_vision/presentation/widgets/profile_card_widget.dart';
import 'package:vintage_vision/presentation/widgets/main_logo_icon.dart';
import 'package:vintage_vision/presentation/widgets/card_widget.dart';
import 'package:vintage_vision/core/constants/app_colors.dart';
import 'package:vintage_vision/core/constants/app_size.dart';
import 'package:vintage_vision/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:vintage_vision/core/models/profile_model.dart';// Importa el modelo

class ProfilesScreen extends StatefulWidget {
  const ProfilesScreen({super.key});
  
  @override
  State<ProfilesScreen> createState() => _ProfilesScreenState();
}

class _ProfilesScreenState extends State<ProfilesScreen> {
  final AuthService _authService = AuthService();
  List<Profile> _profiles = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfiles();
  }

  Future<void> _loadProfiles() async {
    setState(() => _isLoading = true);
    
    final profiles = await _authService.getUserProfiles();
    
    setState(() {
      _profiles = profiles ?? [];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vintageRed,
      body: Center(
        child: _isLoading
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.height(context) * 0.01),
                  const MainLogoWidget(),
                  SizedBox(height: AppSize.height(context) * 0.07),
                  CardWidget(
                    title: 'Perfiles',
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 30,
                          runSpacing: 35,
                          children: [
                            // Mostrar perfiles existentes
                            ..._profiles.map((profile) => ProfileCardWidget(
                              profileName: profile.name,
                              imageUrl: profile.avatarUrl,
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.principal);
                              },
                            )),
                            
                            // Botón para agregar nuevo perfil
                            ProfileCardWidget(
                              imageUrl: 'lib/assets/images/add_icon.png',
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.newperfil);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}