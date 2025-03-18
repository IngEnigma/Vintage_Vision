class WatchHistory {
  final String id;
  final String profileId;
  final String movieId;
  final DateTime timestamp;
  final int durationWatched;
  final bool finished;

  WatchHistory({
    required this.id,
    required this.profileId,
    required this.movieId,
    required this.timestamp,
    required this.durationWatched,
    this.finished = false,
  });
}
