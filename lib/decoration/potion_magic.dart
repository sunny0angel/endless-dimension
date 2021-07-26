import 'package:bonfire/bonfire.dart';
import 'package:endless_dimension/db/database.dart';
import 'package:endless_dimension/map/dungeon_map.dart';

class PotionMagic extends GameDecoration with Sensor {
  // double _lifeDistributed = 0;

  PotionMagic(Vector2 position, double life)
      : super.withSprite(
          Sprite.load('items/potion_magic.png'),
          position: position,
          width: DungeonMap.tileSize * 0.5,
          height: DungeonMap.tileSize * 0.5,
        );

  @override
  void onContact(GameComponent component) {
    final db = DBProvider.db.database;
    if (component is Player) {
      db!
          .into(db.playerItems)
          .insert(PlayerItem(itemid: 2, bagindex: 101, cnt: 1));
      remove();
    }
  }
}
