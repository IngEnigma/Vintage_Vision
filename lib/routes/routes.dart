import 'package:vintage_vision/presentation/screens/welcome_screen.dart';
import 'package:vintage_vision/presentation/screens/singup_screen.dart';
import 'package:vintage_vision/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String login = '/login';
  static const String singup = '/singup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case singup:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
    }
  }
}
