import 'package:hive/hive.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 0)
class MovieModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String url;

  @HiveField(2)
  final String primaryTitle;

  @HiveField(3)
  final String originalTitle;

  @HiveField(4)
  final String type;

  @HiveField(5)
  final String description;

  @HiveField(6)
  final String primaryImage;

  @HiveField(7)
  final String contentRating;

  @HiveField(8)
  final int startYear;

  @HiveField(9)
  final String releaseDate;

  @HiveField(10)
  final List<String> interests;

  @HiveField(11)
  final List<String> countriesOfOrigin;

  @HiveField(12)
  final List<String> externalLinks;

  @HiveField(13)
  final List<String> spokenLanguages;

  @HiveField(14)
  final List<String> filmingLocations;

  @HiveField(15)
  final double budget;

  @HiveField(16)
  final double grossWorldwide;

  @HiveField(17)
  final List<String> genres;

  @HiveField(18)
  final bool isAdult;

  @HiveField(19)
  final int runtimeMinutes;

  @HiveField(20)
  final double averageRating;

  @HiveField(21)
  final int numVotes;

  MovieModel({
    required this.id,
    required this.url,
    required this.primaryTitle,
    required this.originalTitle,
    required this.type,
    required this.description,
    required this.primaryImage,
    required this.contentRating,
    required this.startYear,
    required this.releaseDate,
    required this.interests,
    required this.countriesOfOrigin,
    required this.externalLinks,
    required this.spokenLanguages,
    required this.filmingLocations,
    required this.budget,
    required this.grossWorldwide,
    required this.genres,
    required this.isAdult,
    required this.runtimeMinutes,
    required this.averageRating,
    required this.numVotes,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? '',
      url: json['url'] ?? '',
      primaryTitle: json['primaryTitle'] ?? '',
      originalTitle: json['originalTitle'] ?? '',
      type: json['type'] ?? '',
      description: json['description'] ?? '',
      primaryImage: json['primaryImage'] ?? '',
      contentRating: json['contentRating'] ?? '',
      startYear: json['startYear'] ?? 0,
      releaseDate: json['releaseDate'] ?? '',
      interests: List<String>.from(json['interests'] ?? []),
      countriesOfOrigin: List<String>.from(json['countriesOfOrigin'] ?? []),
      externalLinks: List<String>.from(json['externalLinks'] ?? []),
      spokenLanguages: List<String>.from(json['spokenLanguages'] ?? []),
      filmingLocations: List<String>.from(json['filmingLocations'] ?? []),
      budget: (json['budget'] ?? 0).toDouble(),
      grossWorldwide: (json['grossWorldwide'] ?? 0).toDouble(),
      genres: List<String>.from(json['genres'] ?? []),
      isAdult: json['isAdult'] ?? false,
      runtimeMinutes: json['runtimeMinutes'] ?? 0,
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      numVotes: json['numVotes'] ?? 0,
    );
  }
}