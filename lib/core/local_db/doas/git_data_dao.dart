import 'package:demotask/core/local_db/moor_db.dart';
import 'package:demotask/core/local_db/table/git_data_entity.dart';
import 'package:moor/moor.dart';

part 'git_data_dao.g.dart';

@UseDao(tables: [GitDataEntity])
class GitDataDao extends DatabaseAccessor<MoorDbClient> with _$GitDataDaoMixin {
  GitDataDao(MoorDbClient db) : super(db);

  Future<int> insert(GitDataEntityData gitDataEntityData) => into(gitDataEntity)
      .insert(gitDataEntityData, mode: InsertMode.insertOrReplace);

  Future<List<GitDataEntityData>> getGitData() => select(gitDataEntity).get();
}
