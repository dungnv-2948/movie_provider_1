class Movie {
  String? posterPath;
  bool? adult;
  String overview;
  String releaseDate;
  List<int> genreIds;
  int id;
  String originalTitle;
  String originalLanguage;
  String title;
  String? backdropPath;
  num popularity;
  int voteCount;
  bool video;
  num voteAverage;

  Movie({
    this.posterPath,
    this.adult,
    this.overview = '',
    this.releaseDate = '',
    this.genreIds = const [],
    this.id = 0,
    this.originalTitle = '',
    this.originalLanguage = '',
    this.title = '',
    this.backdropPath,
    this.popularity = 0,
    this.voteCount = 0,
    this.video = false,
    this.voteAverage = 0,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        posterPath: json["poster_path"],
        adult: json["adult"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        genreIds: List<int>.from(json["genre_ids"]),
        id: json["id"],
        originalTitle: json["original_title"],
        originalLanguage: json["original_language"],
        backdropPath: json["backdrop_path"],
        title: json["title"],
        popularity: json["popularity"],
        voteCount: json["vote_count"],
        video: json["video"],
        voteAverage: json["vote_average"],
      );
}
