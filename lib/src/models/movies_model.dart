import 'dart:convert';

class MoviesModel {
  final num id;
  final String title;
  final bool adult;
  final String backdropPath;
  final List genreIds;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MoviesModel(
      this.id,
      this.title,
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'adult': adult,
      'backdropPath': backdropPath,
      'genreIds': genreIds,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory MoviesModel.fromMap(Map<String, dynamic> map) {
    return MoviesModel(
      map['id'] ?? 0,
      map['title'] ?? '',
      map['adult'] ?? false,
      map['backdropPath'] ?? '',
      List.from(map['genreIds']),
      map['originalLanguage'] ?? '',
      map['originalTitle'] ?? '',
      map['overview'] ?? '',
      map['popularity']?.toDouble() ?? 0.0,
      map['posterPath'] ?? '',
      DateTime.fromMillisecondsSinceEpoch(map['releaseDate']),
      map['video'] ?? false,
      map['voteAverage']?.toDouble() ?? 0.0,
      map['voteCount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesModel.fromJson(String source) => MoviesModel.fromMap(json.decode(source));
}
