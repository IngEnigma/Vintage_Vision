// lib/models/profile_model.dart
class Profile {
  final String id;
  final String name;
  final String avatarUrl;
  final List<String> viewingHistory;

  Profile({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.viewingHistory = const [],
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id']?.toString() ?? '0',
      name: json['name'] ?? 'Perfil sin nombre',
      avatarUrl: json['avatar_url'] ?? 'assets/images/user_icon.png',
      viewingHistory: List<String>.from(json['viewing_history'] ?? []),
    );
  }
}