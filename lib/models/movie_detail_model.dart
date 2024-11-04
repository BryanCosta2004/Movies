class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      runtime: json['runtime'] ?? 0,
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }
}