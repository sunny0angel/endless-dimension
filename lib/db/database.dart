import 'package:moor/moor.dart';

// import 'package:moor/ffi.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;

import 'package:moor_flutter/moor_flutter.dart';

import 'constructDb/construct_db.dart';

part 'database.g.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database? _database;

  Database? get database {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = constructDb();
    return _database;
  }
}

@UseMoor(
  // relative import for the moor file. Moor also supports `package:`
  // imports
  include: {'tables.moor'},
)
class Database extends _$Database {
  // Database() : super(_openConnection());
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        // populate data
        await into(items).insert(Item(
          name: "life_potion",
          type: "0",
          description: "Life Potion",
          imagePath: "assets/images/items/potion_life.png",
          life: 30,
        ));
        await into(items).insert(Item(
          name: "magic_potion",
          type: "0",
          description: "Magic Potion",
          imagePath: "assets/images/items/potion_magic.png",
          magic: 30,
        ));
      },
    );
  }
}

// LazyDatabase _openConnection() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return VmDatabase(file);
//   });
// }
