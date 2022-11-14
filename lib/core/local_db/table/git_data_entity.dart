import 'package:moor/moor.dart';

class GitDataEntity extends Table {
  IntColumn get id => integer()();
  IntColumn get stargazersCount => integer()();
  IntColumn get watchersCount => integer()();

  TextColumn get name => text().nullable()();

  TextColumn get fullName => text().nullable()();

  TextColumn get description => text().nullable()();

  TextColumn get language => text().nullable()();

  @override
  Set<Column> get primaryKey => {fullName};
}
