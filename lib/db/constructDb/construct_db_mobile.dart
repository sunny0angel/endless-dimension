import 'package:moor_flutter/moor_flutter.dart';

import '../database.dart';

Database constructDb() {
  return Database(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));
}
