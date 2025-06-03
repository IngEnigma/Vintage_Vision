class Movie {
  final String id;
  final String title;
  final String genre;
  final int year;
  final String url;
  final String thumbnail;
  final String description;

  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.year,
    this.url = '', // in production this will be required
    required this.thumbnail,
    required this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'].toString(),
      title: json['title'],
      genre: json['genre'],
      year: json['year'],
      url: json['stream_url'] ?? '',
      thumbnail: json['image_url'],
      description: json['description'],
    );
  }
}
