import 'dart:io';

import 'package:demotask/core/local_db/doas/git_data_dao.dart';
import 'package:demotask/ui/home_screen/model/git_data_model.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'table/git_data_entity.dart';
part 'moor_db.g.dart';

@UseMoor(tables: [
  GitDataEntity,
], daos: [
  GitDataDao,
])
class MoorDbClient extends _$MoorDbClient {
  MoorDbClient._()
      : super(LazyDatabase(() async {
          final dbFolder = await getApplicationDocumentsDirectory();
          final file = File(p.join(dbFolder.path, 'db.sqlite'));
          return VmDatabase(file);
        }));

  static Future<MoorDbClient> getInstance() async {
    return MoorDbClient._();
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {},
      );

  Future<void> insert(List<GitDummyDataModel> gitDummyDataModel) async {
    gitDummyDataModel
        .map((e) async => await gitDataDao.insert(e.toEntity()))
        .toList();
  }

  Future<List<GitDataEntityData>> getNotificationData() {
    return gitDataDao.getGitData();
  }
}
