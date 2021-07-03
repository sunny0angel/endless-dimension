import 'package:moor/moor_web.dart';

import '../database.dart';

Database constructDb() {
  return Database(WebDatabase('db'));
}
