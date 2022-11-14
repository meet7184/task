import 'package:demotask/core/local_db/moor_db.dart';

class GitDummyDataModel {
  GitDummyDataModel({
    required this.stargazersCount,
    required this.watchersCount,
    required this.language,
    required this.id,
    required this.name,
    required this.fullName,
    required this.description,
  });
  int stargazersCount;
  int watchersCount;
  String language;
  int id;
  String name;
  String fullName;
  String description;

  factory GitDummyDataModel.fromJson(Map<dynamic, dynamic> json) =>
      GitDummyDataModel(
        stargazersCount: json["stargazers_count"] ?? -1,
        watchersCount: json["watchers_count"] ?? -1,
        language: json["language"] ?? "",
        id: json["id"] ?? -1,
        name: json["name"] ?? "",
        fullName: json["full_name"] ?? "",
        description: json["description"] ?? "",
      );

  factory GitDummyDataModel.fromEntity(GitDataEntityData entity) {
    return GitDummyDataModel(
        stargazersCount: entity.stargazersCount,
        id: entity.id,
        description: entity.description ?? "",
        fullName: entity.fullName ?? "",
        language: entity.language ?? "",
        name: entity.name ?? "",
        watchersCount: entity.watchersCount);
  }

  GitDataEntityData toEntity() {
    return GitDataEntityData(
        stargazersCount: stargazersCount,
        id: id,
        description: description,
        fullName: fullName,
        language: language,
        name: name,
        watchersCount: watchersCount);
  }
}
