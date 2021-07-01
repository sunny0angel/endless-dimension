import 'package:moor/moor_web.dart';

import '../database.dart';

Database constructDbWeb() {
  return Database(WebDatabase('db'));
}
