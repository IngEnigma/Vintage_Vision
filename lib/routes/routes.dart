import 'package:vintage_vision/presentation/screens/profiles_screen.dart';
import 'package:vintage_vision/presentation/screens/welcome_screen.dart';
import 'package:vintage_vision/presentation/screens/singup_screen.dart';
import 'package:vintage_vision/presentation/screens/login_screen.dart';
import 'package:vintage_vision/presentation/screens/newperfil_screen.dart';
import 'package:vintage_vision/presentation/screens/principal_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String login = '/login';
  static const String singup = '/singup';
  static const String profiles = '/profiles';
  static const String newperfil = '/newperfil';
  static const String principal = '/principal';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case singup:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case profiles:
        return MaterialPageRoute(builder: (_) => ProfilesScreen());
      case newperfil:
        return MaterialPageRoute(builder: (_) => NewperfilScreen());
      case principal:
        return MaterialPageRoute(builder: (_) => PrincipalScreen());
      default:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
    }
  }
}
