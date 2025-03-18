class Recommendation {
  final String profileId;
  final List<String>
  recommendedMovies; // list of movie ids recommended by the IA

  Recommendation({required this.profileId, required this.recommendedMovies});
}
