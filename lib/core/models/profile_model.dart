class Profile {
  final String id;
  final String name;
  final String avatarUrl;
  final List<String> viewingHistory; // List of movie IDs

  Profile({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.viewingHistory = const [], // in productio this will be required
  });
}
