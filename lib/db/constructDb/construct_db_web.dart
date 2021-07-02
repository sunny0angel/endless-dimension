import 'package:moor/moor_web.dart';

import '../database.dart';

Database constructDb() {
  var webDatabase;
  MoorWebStorage.indexedDbIfSupported('db')
      .then((value) => webDatabase = WebDatabase.withStorage(value));
  return Database(webDatabase);
}
