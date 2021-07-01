import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/collision/object_collision.dart';
import 'package:endless_dimension/db/database.dart';
import 'package:endless_dimension/map/dungeon_map.dart';
import 'package:flame/position.dart';

class PotionMagic extends GameDecoration with Sensor {
  final Position initPosition;
  final double life;
  // double _lifeDistributed = 0;

  PotionMagic(this.initPosition, this.life)
      : super.sprite(
          Sprite('items/potion_magic.png'),
          position: initPosition,
          width: DungeonMap.tileSize * 0.5,
          height: DungeonMap.tileSize * 0.5,
        );

  @override
  void onContact(ObjectCollision collision) {
    final db = DBProvider.db.database;
    if (collision is Player) {
      db
          .into(db.playerItems)
          .insert(PlayerItem(itemid: 2, bagindex: 101, cnt: 1));
      remove();
    }
  }
}
