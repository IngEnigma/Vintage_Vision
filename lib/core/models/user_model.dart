import 'profile_model.dart';

class User {
  final String id;
  final String email;
  final String username;
  final bool isAdmin;
  final List<Profile> profiles;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.isAdmin,
    required this.profiles,
  });
}
