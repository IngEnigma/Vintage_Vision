import 'package:vintage_vision/presentation/screens/profiles_screen.dart';
import 'package:vintage_vision/presentation/screens/welcome_screen.dart';
import 'package:vintage_vision/presentation/screens/singup_screen.dart';
import 'package:vintage_vision/presentation/screens/login_screen.dart';
import 'package:vintage_vision/presentation/screens/newperfil_screen.dart';
import 'package:vintage_vision/presentation/screens/principal_screen.dart';
import 'package:vintage_vision/presentation/screens/add_movie_screen.dart';
import 'package:vintage_vision/presentation/screens/edit_movie_screen.dart';
import 'package:vintage_vision/presentation/screens/editperfil_screen.dart';
import 'package:vintage_vision/presentation/screens/profile_settings_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String login = '/login';
  static const String singup = '/singup';
  static const String profiles = '/profiles';
  static const String newperfil = '/newperfil';
  static const String principal = '/principal';
  static const String addmovie = '/addmovie';
  static const String editmovie = '/editmovie';
  static const String editperfil = '/editperfil';
    static const String confiperfil = '/confiperfil';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case singup:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case addmovie:
        return MaterialPageRoute(builder: (_) => AddMovieScreen());
      case editmovie:
        return MaterialPageRoute(builder: (_) => EditMovieScreen());
      case editperfil:
        return MaterialPageRoute(builder: (_) => EditperfilScreen());
      case profiles:
        return MaterialPageRoute(builder: (_) => ProfilesScreen());
      case newperfil:
        return MaterialPageRoute(builder: (_) => NewperfilScreen());
      case principal:
        return MaterialPageRoute(builder: (_) => PrincipalScreen());
      case confiperfil:
        return MaterialPageRoute(builder: (_) => ProfileSettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
    }
  }
}