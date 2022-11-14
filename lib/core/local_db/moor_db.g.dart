// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class GitDataEntityData extends DataClass
    implements Insertable<GitDataEntityData> {
  final int id;
  final int stargazersCount;
  final int watchersCount;
  final String? name;
  final String? fullName;
  final String? description;
  final String? language;
  GitDataEntityData(
      {required this.id,
      required this.stargazersCount,
      required this.watchersCount,
      this.name,
      this.fullName,
      this.description,
      this.language});
  factory GitDataEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GitDataEntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      stargazersCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stargazers_count'])!,
      watchersCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}watchers_count'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      fullName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}full_name']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      language: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}language']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stargazers_count'] = Variable<int>(stargazersCount);
    map['watchers_count'] = Variable<int>(watchersCount);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String?>(fullName);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String?>(language);
    }
    return map;
  }

  GitDataEntityCompanion toCompanion(bool nullToAbsent) {
    return GitDataEntityCompanion(
      id: Value(id),
      stargazersCount: Value(stargazersCount),
      watchersCount: Value(watchersCount),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
    );
  }

  factory GitDataEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GitDataEntityData(
      id: serializer.fromJson<int>(json['id']),
      stargazersCount: serializer.fromJson<int>(json['stargazersCount']),
      watchersCount: serializer.fromJson<int>(json['watchersCount']),
      name: serializer.fromJson<String?>(json['name']),
      fullName: serializer.fromJson<String?>(json['fullName']),
      description: serializer.fromJson<String?>(json['description']),
      language: serializer.fromJson<String?>(json['language']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'stargazersCount': serializer.toJson<int>(stargazersCount),
      'watchersCount': serializer.toJson<int>(watchersCount),
      'name': serializer.toJson<String?>(name),
      'fullName': serializer.toJson<String?>(fullName),
      'description': serializer.toJson<String?>(description),
      'language': serializer.toJson<String?>(language),
    };
  }

  GitDataEntityData copyWith(
          {int? id,
          int? stargazersCount,
          int? watchersCount,
          String? name,
          String? fullName,
          String? description,
          String? language}) =>
      GitDataEntityData(
        id: id ?? this.id,
        stargazersCount: stargazersCount ?? this.stargazersCount,
        watchersCount: watchersCount ?? this.watchersCount,
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        description: description ?? this.description,
        language: language ?? this.language,
      );
  @override
  String toString() {
    return (StringBuffer('GitDataEntityData(')
          ..write('id: $id, ')
          ..write('stargazersCount: $stargazersCount, ')
          ..write('watchersCount: $watchersCount, ')
          ..write('name: $name, ')
          ..write('fullName: $fullName, ')
          ..write('description: $description, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, stargazersCount, watchersCount, name,
      fullName, description, language);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GitDataEntityData &&
          other.id == this.id &&
          other.stargazersCount == this.stargazersCount &&
          other.watchersCount == this.watchersCount &&
          other.name == this.name &&
          other.fullName == this.fullName &&
          other.description == this.description &&
          other.language == this.language);
}

class GitDataEntityCompanion extends UpdateCompanion<GitDataEntityData> {
  final Value<int> id;
  final Value<int> stargazersCount;
  final Value<int> watchersCount;
  final Value<String?> name;
  final Value<String?> fullName;
  final Value<String?> description;
  final Value<String?> language;
  const GitDataEntityCompanion({
    this.id = const Value.absent(),
    this.stargazersCount = const Value.absent(),
    this.watchersCount = const Value.absent(),
    this.name = const Value.absent(),
    this.fullName = const Value.absent(),
    this.description = const Value.absent(),
    this.language = const Value.absent(),
  });
  GitDataEntityCompanion.insert({
    required int id,
    required int stargazersCount,
    required int watchersCount,
    this.name = const Value.absent(),
    this.fullName = const Value.absent(),
    this.description = const Value.absent(),
    this.language = const Value.absent(),
  })  : id = Value(id),
        stargazersCount = Value(stargazersCount),
        watchersCount = Value(watchersCount);
  static Insertable<GitDataEntityData> custom({
    Expression<int>? id,
    Expression<int>? stargazersCount,
    Expression<int>? watchersCount,
    Expression<String?>? name,
    Expression<String?>? fullName,
    Expression<String?>? description,
    Expression<String?>? language,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stargazersCount != null) 'stargazers_count': stargazersCount,
      if (watchersCount != null) 'watchers_count': watchersCount,
      if (name != null) 'name': name,
      if (fullName != null) 'full_name': fullName,
      if (description != null) 'description': description,
      if (language != null) 'language': language,
    });
  }

  GitDataEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? stargazersCount,
      Value<int>? watchersCount,
      Value<String?>? name,
      Value<String?>? fullName,
      Value<String?>? description,
      Value<String?>? language}) {
    return GitDataEntityCompanion(
      id: id ?? this.id,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      watchersCount: watchersCount ?? this.watchersCount,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      description: description ?? this.description,
      language: language ?? this.language,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (stargazersCount.present) {
      map['stargazers_count'] = Variable<int>(stargazersCount.value);
    }
    if (watchersCount.present) {
      map['watchers_count'] = Variable<int>(watchersCount.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String?>(fullName.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (language.present) {
      map['language'] = Variable<String?>(language.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GitDataEntityCompanion(')
          ..write('id: $id, ')
          ..write('stargazersCount: $stargazersCount, ')
          ..write('watchersCount: $watchersCount, ')
          ..write('name: $name, ')
          ..write('fullName: $fullName, ')
          ..write('description: $description, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }
}

class $GitDataEntityTable extends GitDataEntity
    with TableInfo<$GitDataEntityTable, GitDataEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GitDataEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _stargazersCountMeta =
      const VerificationMeta('stargazersCount');
  @override
  late final GeneratedColumn<int?> stargazersCount = GeneratedColumn<int?>(
      'stargazers_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _watchersCountMeta =
      const VerificationMeta('watchersCount');
  @override
  late final GeneratedColumn<int?> watchersCount = GeneratedColumn<int?>(
      'watchers_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _fullNameMeta = const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String?> fullName = GeneratedColumn<String?>(
      'full_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _languageMeta = const VerificationMeta('language');
  @override
  late final GeneratedColumn<String?> language = GeneratedColumn<String?>(
      'language', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        stargazersCount,
        watchersCount,
        name,
        fullName,
        description,
        language
      ];
  @override
  String get aliasedName => _alias ?? 'git_data_entity';
  @override
  String get actualTableName => 'git_data_entity';
  @override
  VerificationContext validateIntegrity(Insertable<GitDataEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('stargazers_count')) {
      context.handle(
          _stargazersCountMeta,
          stargazersCount.isAcceptableOrUnknown(
              data['stargazers_count']!, _stargazersCountMeta));
    } else if (isInserting) {
      context.missing(_stargazersCountMeta);
    }
    if (data.containsKey('watchers_count')) {
      context.handle(
          _watchersCountMeta,
          watchersCount.isAcceptableOrUnknown(
              data['watchers_count']!, _watchersCountMeta));
    } else if (isInserting) {
      context.missing(_watchersCountMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {fullName};
  @override
  GitDataEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GitDataEntityData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GitDataEntityTable createAlias(String alias) {
    return $GitDataEntityTable(attachedDatabase, alias);
  }
}

abstract class _$MoorDbClient extends GeneratedDatabase {
  _$MoorDbClient(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $GitDataEntityTable gitDataEntity = $GitDataEntityTable(this);
  late final GitDataDao gitDataDao = GitDataDao(this as MoorDbClient);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [gitDataEntity];
}
